import 'package:flutter/material.dart';
import '../../extensions/context_extension.dart';

class CustomButton extends StatefulWidget {
  final String? title;
  final IconData? icon;
  final double? iconSize;
  final double? maxWith;
  final Color? backgoundColor;
  final double? maxHeight;
  final double? fontSize;
  final Color? fontColor;
  final Color? iconColor;
  final EdgeInsets? padding;
  final Widget? child;
  final Function() onPressed;
  final BorderRadius? borderRadius;
  const CustomButton(
      {Key? key,
      this.title,
      this.maxWith,
      required this.onPressed,
      this.fontSize,
      this.maxHeight,
      this.padding,
      this.child,
      this.backgoundColor,
      this.borderRadius,
      this.icon,
      this.fontColor,
      this.iconSize,
      this.iconColor})
      : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(context.normalRadius),
      onTap: () async {
        await widget.onPressed();
      },
      child: Container(
        padding: widget.padding ?? EdgeInsets.all(context.normalPadding),
        width: widget.maxWith,
        height: widget.maxHeight,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: widget.backgoundColor ?? context.theme.primaryColor,
            borderRadius: widget.borderRadius ?? BorderRadius.circular(context.normalRadius)),
        // ignore: prefer_if_null_operators
        child: widget.child != null
            ? widget.child
            : widget.title != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.icon != null)
                        Padding(
                          padding: EdgeInsets.only(right: context.highPadding),
                          child: Icon(
                            widget.icon,
                            size: widget.iconSize ?? context.highIconSize,
                            color: widget.iconColor ?? widget.fontColor ?? Colors.white,
                          ),
                        ),
                      Text(
                        widget.title!,
                        style: TextStyle(
                          fontSize: widget.fontSize ?? context.highTextSize,
                          color: widget.fontColor ?? Colors.white,
                          fontFamily: context.getDefaultFontFamily,
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
      ),
    );
  }
}
