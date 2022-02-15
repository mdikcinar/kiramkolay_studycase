// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginViewModel on _LoginViewModelBase, Store {
  final _$isCodeSendedAtom = Atom(name: '_LoginViewModelBase.isCodeSended');

  @override
  bool get isCodeSended {
    _$isCodeSendedAtom.reportRead();
    return super.isCodeSended;
  }

  @override
  set isCodeSended(bool value) {
    _$isCodeSendedAtom.reportWrite(value, super.isCodeSended, () {
      super.isCodeSended = value;
    });
  }

  final _$countDownTimeAtom = Atom(name: '_LoginViewModelBase.countDownTime');

  @override
  int get countDownTime {
    _$countDownTimeAtom.reportRead();
    return super.countDownTime;
  }

  @override
  set countDownTime(int value) {
    _$countDownTimeAtom.reportWrite(value, super.countDownTime, () {
      super.countDownTime = value;
    });
  }

  final _$cancelTimerAsyncAction =
      AsyncAction('_LoginViewModelBase.cancelTimer');

  @override
  Future<void> cancelTimer() {
    return _$cancelTimerAsyncAction.run(() => super.cancelTimer());
  }

  final _$_LoginViewModelBaseActionController =
      ActionController(name: '_LoginViewModelBase');

  @override
  void changeIsCodeSended(bool value) {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.changeIsCodeSended');
    try {
      return super.changeIsCodeSended(value);
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _startCountDownTimer() {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase._startCountDownTimer');
    try {
      return super._startCountDownTimer();
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isCodeSended: ${isCodeSended},
countDownTime: ${countDownTime}
    ''';
  }
}
