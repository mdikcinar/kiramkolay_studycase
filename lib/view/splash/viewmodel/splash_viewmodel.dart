import 'package:flutter/material.dart';

class SplashViewModel extends ChangeNotifier {
  bool _isUserLoggedIn = false;

  set isUserLoggedIn(bool value) {
    _isUserLoggedIn = value;
    notifyListeners();
  }

  bool get isUserLoggedIn => _isUserLoggedIn;
}
