import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final double radius;
  const Skeleton({
    super.key,
    this.width,
    this.height,
    this.radius = 10,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        baseColor: Theme.of(context).focusColor.withOpacity(0.1),
        highlightColor:
            (color ?? Theme.of(context).focusColor).withOpacity(0.8),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              color: Theme.of(context).scaffoldBackgroundColor),
        ),
      ),
    );
  }
}
