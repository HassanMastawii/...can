import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const String validateMax = "يجب ان لايتعدى الحقل عن عدد محارف ";
const String validateMin = "يجب ان لا يقل الحقل عن عدد محارف ";

// ignore: must_be_immutable
class MyTextFormField extends StatelessWidget {
  final String labelText;
  final TextInputType textInputType;
  TextEditingController? textEditingController;
  final Widget? preIcon;
  final bool enabled;
  final int minimum;
  final int maximum;
  final FocusNode? focusnode;
  final void Function(String)? onChanged;
  String? initVal;
  final Iterable<String>? autofillHints;

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
    this.textEditingController,
  });
  @override
  Widget build(BuildContext context) {
    textEditingController ??= TextEditingController(text: initVal);

    return TextFormField(
      minLines: 1,
      maxLines: textInputType == TextInputType.text ? 6 : 1,
      textAlign: TextAlign.right,
      validator: (value) {
        return validate(
          text: value,
          min: minimum,
          max: maximum,
          msgMin: validateMin,
          msgMax: validateMax,
        );
      },
      textDirection: textInputType == TextInputType.emailAddress
          ? TextDirection.ltr
          : null,
      autofillHints: autofillHints,
      controller: textEditingController,
      enabled: enabled,
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value);
        }
        initVal = value;
      },
      inputFormatters: textInputType != TextInputType.number
          ? null
          : [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
      focusNode: focusnode,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.all(10),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        labelText: labelText,
        prefixIcon: preIcon,
      ),
      // onTapOutside: (event) {
      //   FocusScope.of(context).unfocus();
      // },
      keyboardType: textInputType,
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
