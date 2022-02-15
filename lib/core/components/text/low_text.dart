import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';

class LowText extends StatelessWidget {
  final String text;
  final bool bold;
  final Color? color;
  final String? fontFamily;
  final TextAlign? textAlign;

  const LowText(this.text, {Key? key, this.bold = false, this.color, this.fontFamily, this.textAlign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: context.lowTextSize,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          color: color,
          fontFamily: fontFamily ?? 'Montserrat'),
    );
  }
}
