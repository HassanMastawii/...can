import 'package:canary_app/app/colorApp/color.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class RouletteGame extends StatefulWidget {
  const RouletteGame({Key? key}) : super(key: key);

  @override
  _RouletteGameState createState() => _RouletteGameState();
}

class _RouletteGameState extends State<RouletteGame>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  final List<String> persons = [
    'Person 1',
    'Person 2',
    'Person 3',
    'Person 4',
    'Person 5',
    'Person 6',
    'Person 7',
    'Person 8',
    'Person 9',
  ];

  bool isSpinning = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 30),
    )..addListener(() {
        setState(() {});
      });

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 2 * pi,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 1.0, curve: Curves.easeInOut),
    ));
  }

  Future<void> _startSpin() async {
    if (!isSpinning) {
      isSpinning = true;
      _controller.repeat();

      await Future.delayed(Duration(seconds: 3));

      _controller.stop();
      await Future.delayed(Duration(seconds: 27));

      isSpinning = false;
      _controller.reset();
    }

    // Define intervals for different phases of rotation
    final fastInterval = Interval(0.0, 0.7, curve: Curves.easeInOut);
    final slowInterval = Interval(0.7, 1.0, curve: Curves.easeInOut);

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 2 * pi,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 1.0, curve: Curves.easeInOut),
    ));

    // Apply different intervals to achieve varying speed during rotation
    _rotationAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 2 * pi)
              .chain(CurveTween(curve: fastInterval)),
          weight: 70.0, // Percentage of total duration
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 2 * pi)
              .chain(CurveTween(curve: slowInterval)),
          weight: 30.0, // Percentage of total duration
        ),
      ],
    ).animate(_controller);
  }

  // void _startSpin() async {
  //   if (!isSpinning) {
  //     isSpinning = true;
  //     _controller.repeat();

  //     await Future.delayed(Duration(seconds: 3));

  //     _controller.stop();
  //     await Future.delayed(Duration(seconds: 27));

  //     setState(() {
  //       isSpinning = false;
  //       _controller.reset();
  //     });
  //   }
  // }

  void _stopSpin() {
    if (isSpinning) {
      isSpinning = false;
      _controller.stop();
      Future.delayed(Duration(seconds: 3), () {
        _controller.reset();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Offset calculatePosition(double angle, double radius,
      {Offset center = Offset.zero}) {
    final double x = center.dx + radius * cos(angle);
    final double y = center.dy + radius * sin(angle);
    return Offset(x, y);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 2 * 200.0,
            height: 2 * 200.0,
            child: CustomPaint(
              painter: RoulettePainter(
                controller: _controller,
                rotationAnimation: _rotationAnimation,
                persons: persons,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 11),
            child: ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 100))),
                onPressed: () {
                  if (isSpinning) {
                    _stopSpin();
                  } else {
                    _startSpin();
                  }
                },
                child: Text("ابدء")),
          ),
        ],
      ),
    );
  }
}

class RoulettePainter extends CustomPainter {
  final AnimationController controller;
  final Animation<double> rotationAnimation;
  final List<String> persons;

  RoulettePainter(
      {required this.controller,
      required this.rotationAnimation,
      required this.persons})
      : super(repaint: controller);

  Offset calculatePosition(double angle, double radius,
      {Offset center = Offset.zero}) {
    final double x = center.dx + radius * cos(angle);
    final double y = center.dy + radius * sin(angle);
    return Offset(x, y);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double segmentAngle = 2 * pi / persons.length;

    final double currentRotation = rotationAnimation.value;

    for (int i = 0; i < persons.length; i++) {
      final double startAngle = segmentAngle * i + currentRotation;
      final double endAngle = segmentAngle * (i + 1) + currentRotation;

      final path = Path()
        ..moveTo(centerX, centerY)
        ..lineTo(centerX + radius * cos(startAngle),
            centerY + radius * sin(startAngle))
        ..arcTo(
          Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
          startAngle,
          segmentAngle,
          false,
        )
        ..lineTo(centerX, centerY);

      final personColor = Color((i * 0x123456).toInt()).withOpacity(1.0);

      final paint = Paint()..color = personColor;

      canvas.drawPath(path, paint);

      final personPosition = calculatePosition(
          startAngle + segmentAngle / 2, radius - 50.0,
          center: Offset(centerX, centerY));

      TextPainter(
        text: TextSpan(
          text: persons[i],
          style: TextStyle(fontSize: 12, color: Colors.white),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      )
        ..layout(minWidth: 0, maxWidth: 100)
        ..paint(canvas, personPosition);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
