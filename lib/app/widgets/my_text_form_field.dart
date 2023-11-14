import 'package:flutter/material.dart';

const String validateMax = "يجب ان لايتعدى الحقل عن عدد محارف ";
const String validateMin = "يجب ان لا يقل الحقل عن عدد محارف ";

// ignore: must_be_immutable
class MyTextFormField extends StatefulWidget {
  final String labelText;
  final TextInputType textInputType;
  TextEditingController? controller;
  final Widget? preIcon;
  final bool enabled;
  final int minimum;
  final int maximum;
  final FocusNode? focusnode;
  final void Function(String)? onChanged;
  String? initVal;
  final Iterable<String>? autofillHints;
  final Color color;
  final String? valError;
  MyTextFormField({
    super.key,
    required this.labelText,
    this.enabled = true,
    this.textInputType = TextInputType.text,
    this.preIcon,
    this.minimum = 0,
    this.maximum = 250,
    this.onChanged,
    this.initVal,
    this.autofillHints,
    this.focusnode,
    this.controller,
    this.color = Colors.white,
    this.valError,
  });

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  @override
  Widget build(BuildContext context) {
    widget.controller ??= TextEditingController(text: widget.initVal);

    return TextFormField(
      minLines: 1,
      maxLines: widget.textInputType == TextInputType.text ? 6 : 1,
      validator: (value) {
        return validate(
          text: value,
          min: widget.minimum,
          max: widget.maximum,
          msgMin: widget.valError ?? validateMin,
          msgMax: widget.valError ?? validateMax,
        );
      },
      textDirection: widget.textInputType == TextInputType.emailAddress
          ? TextDirection.ltr
          : null,
      autofillHints: widget.autofillHints,
      controller: widget.controller,
      enabled: widget.enabled,
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
        widget.initVal = value;
      },
      focusNode: widget.focusnode,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        fillColor: widget.color,
        filled: true,
        contentPadding: const EdgeInsets.all(10),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        labelText: widget.labelText,
        prefixIcon: widget.preIcon,
      ),
      keyboardType: widget.textInputType,
    );
  }
}

validate(
    {required String? text,
    required int min,
    required int max,
    required String msgMin,
    required String msgMax}) {
  if (text!.length < min) {
    return '$msgMin $min';
  } else if (text.length > max) {
    return '$msgMax $max';
  } else {
    return null;
  }
}
