import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:flutter/cupertino.dart';
part 'login_viewmodel.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  late BuildContext context;
  @observable
  bool isCodeSended = false;

  @action
  void changeIsCodeSended(bool value) {
    isCodeSended = value;
    if (isCodeSended) _startCountDownTimer();
  }

  @observable
  int countDownTime = 120;

  Timer? _timer;

  @action
  void _startCountDownTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) async {
        countDownTime = countDownTime - 1;
        if (countDownTime <= 0) {
          await cancelTimer();
          isCodeSended = false;
          countDownTime = 120;
        }
      },
    );
  }

  @action
  Future<void> cancelTimer() async {
    if (_timer != null) {
      if (_timer!.isActive) {
        _timer!.cancel();
        debugPrint('Timer Cancelled');
      }
    }
  }
}
