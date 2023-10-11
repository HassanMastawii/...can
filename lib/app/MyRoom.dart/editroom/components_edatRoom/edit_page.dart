import 'package:canary_app/app/widgets/my_button.dart';
import 'package:canary_app/app/widgets/my_pass_form_field.dart';
import 'package:canary_app/app/widgets/my_text_form_field.dart';
import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  const EditPage({
    super.key,
    required this.hint,
    required this.onSubmit,
    this.oldVal,
    required this.title,
    this.secure = false,
  });
  final String hint;
  final String? oldVal;
  final String title;
  final bool secure;

  ///The string of the new value
  final void Function(String) onSubmit;
  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late final TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController(text: widget.oldVal);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: !widget.secure
                      ? MyTextFormField(
                          labelText: widget.hint,
                          textEditingController: _controller,
                        )
                      : MyTextPassField(
                          labelText: widget.hint,
                          textEditingController: _controller,
                        ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyButton(
                    text: "حفظ",
                    onPressed: () {
                      widget.onSubmit(_controller.text);
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyButton(
                    text: "إلغاء",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
