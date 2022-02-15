import 'dart:ui';

import 'package:flutter/material.dart';

class LanguageManager {
  static LanguageManager? _instance;
  static LanguageManager? get instance {
    if (_instance == null) return _instance = LanguageManager._init();
    return _instance;
  }

  LanguageManager._init();

  //final enLocale = const Locale('en', 'US');
  final trLocale = const Locale('tr', 'TR');
  /*final zhLocale = const Locale('zh', 'CN');
  final daLocale = const Locale('da', 'DK');
  final nlLocale = const Locale('nl', 'NL');
  final deLocale = const Locale('de', 'DE');
  final esLocale = const Locale('es', 'ES');
  final frLocale = const Locale('fr', 'FR');
  final hiLocale = const Locale('hi', 'IN');
  final itLocale = const Locale('it', 'IT');
  final jaLocale = const Locale('ja', 'JP');
  final koLocale = const Locale('ko', 'KR');
  final plLocale = const Locale('pl', 'PL');
  final ptLocale = const Locale('pt', 'PT');
  final ruLocale = const Locale('ru', 'RU');*/
  final deviceLocale =
      const Locale('tr', 'TR'); //Locale(Platform.localeName.substring(0, 2), Platform.localeName.substring(3, 5));
  List<Locale> get supportedLocales {
    var locales = [
      //enLocale,
      trLocale,
    ];
    if (locales.contains(deviceLocale)) {
      return locales;
    }
    //locales.add(deviceLocale);
    return locales;
  }
}
