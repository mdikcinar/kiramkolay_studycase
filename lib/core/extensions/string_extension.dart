import 'package:easy_localization/easy_localization.dart';

extension StringExtension on String {
  String get locale => this.tr();

  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }

  bool isValidUsername() {
    return RegExp(r'^[A-Za-z][A-Za-z0-9_]{3,18}$').hasMatch(this);
  }

  bool isValidPhoneNumber() {
    return RegExp(r'^/(\+\d{1,3}\s?)?((\(\d{3}\)\s?)|(\d{3})(\s|-?))(\d{3}(\s|-?))(\d{4})(\s?(([E|e]xt[:|.|]?)|x|X)(\s?\d+))?/g')
        .hasMatch(this);
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String useCorrectEllipsis() {
    return replaceAll('', '\u200B');
  }
}
