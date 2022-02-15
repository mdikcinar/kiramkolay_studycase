import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';

class HighText extends StatelessWidget {
  final String text;
  final bool bold;
  final TextOverflow? textOverflow;
  final double? letterSpacing;
  final String? fontFamily;
  final Color? color;
  final TextAlign? textAlign;
  const HighText(this.text,
      {Key? key, this.bold = false, this.color, this.textOverflow, this.letterSpacing, this.textAlign, this.fontFamily})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: context.highTextSize,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          color: color ?? context.defaultTextColor,
          letterSpacing: letterSpacing,
          fontFamily: fontFamily ?? 'Montserrat'),
      textAlign: textAlign,
      overflow: textOverflow,
    );
  }
}
