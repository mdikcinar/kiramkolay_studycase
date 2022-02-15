import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kiramkolay/core/extensions/context_extension.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final Function()? onTap;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  const CustomTextField({
    Key? key,
    this.hintText,
    this.onTap,
    this.keyboardType,
    this.controller,
    this.inputFormatters,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      keyboardType: keyboardType,
      controller: controller,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(context.normalRadius)),
        contentPadding: EdgeInsets.only(left: context.normalPadding),
        labelText: hintText,
        labelStyle: TextStyle(
          fontFamily: context.getDefaultFontFamily,
          fontSize: context.normalTextSize,
        ),
        counterText: '',
      ),
    );
  }
}
