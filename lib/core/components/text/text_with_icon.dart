import 'package:flutter/material.dart';
import '../../extensions/context_extension.dart';

class TextWithIcon extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? iconColor;
  final bool bold;
  final IconData? icon;
  final Widget? leading;
  final double? iconSize;
  final double? padding;
  final EdgeInsets? outsidePadding;
  final double? textSize;
  const TextWithIcon({
    required this.text,
    this.icon,
    Key? key,
    this.iconSize,
    this.padding,
    this.textSize,
    this.textColor,
    this.iconColor,
    this.outsidePadding,
    this.leading,
    this.bold = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outsidePadding ?? EdgeInsets.all(context.normalPadding),
      child: Row(
        children: [
          if (icon != null && leading == null)
            Icon(
              icon,
              size: iconSize ?? context.normalIconSize,
              color: iconColor ?? context.defaultTextColor,
            ),
          if (leading != null && icon == null) leading!,
          SizedBox(width: padding ?? context.lowPadding),
          Text(
            text,
            style: TextStyle(
                color: textColor ?? context.defaultTextColor,
                fontSize: textSize ?? context.highTextSize,
                fontWeight: bold ? FontWeight.bold : null),
          ),
        ],
      ),
    );
  }
}
