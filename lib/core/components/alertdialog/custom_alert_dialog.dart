import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';
import '../text/extra_high_text.dart';
import '../text/high_text.dart';

Future<void> showCustomAlertDialog({
  required BuildContext context,
  required String? title,
  bool centerTitle = false,
  bool popAutomaticly = true,
  String? subtitle,
  Widget? child,
  required Function() onPressedYes,
  bool secButton = false,
  bool noButton = true,
  bool barrierDismissible = true,
  List<Widget>? actions,
  Function()? onPressedSecButton,
  Function()? onWillPop,
  String cacelButtonText = 'No',
  String secButtonText = 'No',
  String yesButtonText = 'Yes',
  EdgeInsetsGeometry? contentPadding,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible, // user must tap button!

    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async {
          if (onWillPop != null) {
            onWillPop();
          }
          return true;
        },
        child: AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(context.normalRadius))),
          title: centerTitle
              ? Center(child: ExtraHighText(title!, fontFamily: context.getDefaultFontFamily))
              : ExtraHighText(title!, fontFamily: context.getDefaultFontFamily),
          contentPadding: contentPadding ?? const EdgeInsets.fromLTRB(24.0, 20, 24.0, 0),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                if (subtitle != null) HighText(subtitle),
                if (child != null) child,
              ],
            ),
          ),
          actions: actions ??
              <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    secButton
                        ? TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              onPressedSecButton!();
                            },
                            child: Text(
                              secButtonText,
                              style: TextStyle(color: context.theme.primaryColor, fontSize: context.highTextSize),
                            ),
                          )
                        : const SizedBox(),
                    noButton
                        ? TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              cacelButtonText,
                              style: TextStyle(color: context.theme.primaryColor, fontSize: context.highTextSize),
                            ),
                          )
                        : const SizedBox(),
                    TextButton(
                      onPressed: () {
                        if (popAutomaticly) Navigator.of(context).pop();
                        onPressedYes();
                      },
                      child: Text(
                        yesButtonText,
                        style: TextStyle(color: context.theme.primaryColor, fontSize: context.highTextSize),
                      ),
                    ),
                  ],
                ),
              ],
        ),
      );
    },
  );
}
