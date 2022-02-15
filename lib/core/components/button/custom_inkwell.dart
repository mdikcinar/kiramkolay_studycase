import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';

class CustomInkwell extends StatelessWidget {
  final Function() onTap;
  final double? padding;
  final Widget child;
  const CustomInkwell({Key? key, required this.onTap, required this.child, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      borderRadius: BorderRadius.circular(context.lowRadius),
      child: padding != 0
          ? Padding(
              padding: EdgeInsets.all(padding ?? context.normalPadding),
              child: child,
            )
          : child,
    );
  }
}
