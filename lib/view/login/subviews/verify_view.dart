part of '../login_view.dart';

extension _VerifyView on _LoginViewState {
  Column verifyView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        logo(),
        context.highSizedBoxHeight,
        loginTitleText('Telefonunuza gelen kodu girin'),
        context.highSizedBoxHeight,
        verifySubtitleText(),
        context.highSizedBoxHeight,
        pinPutField(),
        context.highSizedBoxHeight,
        timerText(),
        CustomInkwell(
          onTap: () {},
          child: Text(
            'kodu alamadım',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: context.theme.primaryColor,
              fontWeight: FontWeight.bold,
              fontFamily: context.getDefaultFontFamily,
            ),
          ),
        )
      ],
    );
  }

  Widget verifySubtitleText() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: countryCodeTEC.text + phoneNumberTEC.text, style: const TextStyle(fontWeight: FontWeight.bold)),
          const TextSpan(text: ' numarasına gönderdiğimiz 6 haneli kodu'),
          const TextSpan(text: ' giriniz.', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: context.normalTextSize,
        color: context.defaultTextColor.withOpacity(0.6),
        fontFamily: context.getDefaultFontFamily,
        height: context.highTextHeight,
      ),
    );
  }

  PinPut pinPutField() {
    return PinPut(
      fieldsCount: 6,
      eachFieldHeight: context.dynamicHeight(0.05),
      eachFieldWidth: context.dynamicHeight(0.05),
      onSubmit: (String pin) => debugPrint(pin.toString()),
      //focusNode: _pinPutFocusNode,
      //controller: _pinPutController,
      submittedFieldDecoration: _pinPutDecoration.copyWith(
        borderRadius: BorderRadius.circular(context.highRadius),
      ),
      selectedFieldDecoration: _pinPutDecoration,
      followingFieldDecoration: _pinPutDecoration.copyWith(
        borderRadius: BorderRadius.circular(context.lowRadius),
        border: Border.all(
          color: context.defaultTextColor.withOpacity(0.2),
        ),
      ),
    );
  }

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: context.theme.primaryColor.withOpacity(0.6)),
      borderRadius: BorderRadius.circular(context.lowRadius),
    );
  }

  Widget timerText() {
    return Text(
      Duration(seconds: loginViewModel.countDownTime).formatDuration(),
      style: TextStyle(
        fontSize: context.dynamicHeight(0.05),
        color: context.defaultTextColor,
        fontFamily: context.getDefaultMonoSpaceFontFamily,
      ),
    );
  }
}
