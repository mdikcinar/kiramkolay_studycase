import 'package:flutter/material.dart';
import '../../extensions/context_extension.dart';

class CustomOutlinedButton extends StatefulWidget {
  final String? title;
  final IconData? icon;
  final double? iconSize;
  final double? minWith;
  final double? minHeight;
  final double? fontSize;
  final Color? fontColor;
  final FontWeight? fontWeight;
  final Color? iconColor;
  final Color? borderColor;
  final EdgeInsets? padding;
  final Widget? child;
  final Function() onPressed;
  final BorderRadius? borderRadius;
  const CustomOutlinedButton(
      {Key? key,
      this.title,
      this.minWith,
      required this.onPressed,
      this.fontSize,
      this.minHeight,
      this.padding,
      this.child,
      this.borderRadius,
      this.icon,
      this.fontColor,
      this.iconSize,
      this.iconColor,
      this.borderColor,
      this.fontWeight})
      : super(key: key);

  @override
  _CustomOutlinedButtonState createState() => _CustomOutlinedButtonState();
}

class _CustomOutlinedButtonState extends State<CustomOutlinedButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(context.normalRadius),
      onTap: () async {
        await widget.onPressed();
      },
      child: Container(
        padding: widget.padding ?? EdgeInsets.all(context.normalPadding),
        width: widget.minWith,
        height: widget.minHeight,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(context.normalRadius),
          border: Border.all(color: widget.borderColor ?? context.theme.primaryColor),
        ),
        child: widget.child ??
            (widget.title != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.icon != null)
                        Padding(
                          padding: EdgeInsets.only(right: context.highPadding),
                          child: Icon(
                            widget.icon,
                            size: widget.iconSize ?? context.highIconSize,
                            color: widget.iconColor ?? widget.fontColor ?? context.theme.primaryColor,
                          ),
                        ),
                      Text(
                        widget.title!,
                        style: TextStyle(
                          fontSize: widget.fontSize ?? context.highTextSize,
                          color: widget.fontColor ?? context.theme.primaryColor,
                          fontFamily: context.getDefaultFontFamily,
                          fontWeight: widget.fontWeight,
                        ),
                      ),
                    ],
                  )
                : const SizedBox()),
      ),
    );
  }
}
