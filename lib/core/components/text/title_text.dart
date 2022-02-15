import 'package:flutter/material.dart';
import '../../extensions/context_extension.dart';

class TitleText extends StatelessWidget {
  final String text;
  final bool bold;
  final Color? color;
  final String? fontFamily;

  const TitleText(this.text, {Key? key, this.bold = false, this.color, this.fontFamily}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: context.titleTextSize,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        color: color,
        fontFamily: fontFamily,
      ),
    );
  }
}
