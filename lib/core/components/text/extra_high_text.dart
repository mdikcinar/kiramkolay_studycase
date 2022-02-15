import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';

class ExtraHighText extends StatelessWidget {
  final String text;
  final bool bold;
  final Color? color;
  final double? letterSpacing;
  final TextAlign? textAlign;
  final String? fontFamily;
  const ExtraHighText(this.text, {Key? key, this.bold = false, this.color, this.letterSpacing, this.textAlign, this.fontFamily})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: context.extraHighTextSize,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        color: color,
        letterSpacing: letterSpacing,
        fontFamily: fontFamily ?? 'Montserrat',
      ),
      textAlign: textAlign,
    );
  }
}
