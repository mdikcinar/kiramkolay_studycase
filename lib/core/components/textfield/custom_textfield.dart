import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../extensions/context_extension.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final Function()? onTap;
  final bool? isDense;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final BoxConstraints? prefixIconConstraints;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? prefixIcon;
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
    this.isDense,
    this.prefixIconConstraints,
    this.prefixIcon,
    this.contentPadding,
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.normalRadius),
        ),
        contentPadding: contentPadding ?? EdgeInsets.only(left: context.normalPadding),
        isDense: isDense,
        prefixIconConstraints: prefixIconConstraints,
        prefixIcon: prefixIcon,
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
