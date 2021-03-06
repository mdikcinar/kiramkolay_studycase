import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/components/button/costom_outlined_button.dart';
import '../../core/components/button/custom_button.dart';
import '../../core/components/button/custom_inkwell.dart';
import '../../core/components/country_picker/selection_dialog.dart';
import '../../core/components/text/high_text.dart';
import '../../core/components/text/normal_text.dart';
import '../../core/extensions/context_extension.dart';
import '../../core/extensions/duration_extension.dart';
import '../../core/extensions/string_extension.dart';
import '../../core/init/language/locale_keys.g.dart';
import '../../core/init/navigation/navigation_constants.dart';
import '../../core/init/navigation/navigation_service.dart';
import 'package:pinput/pin_put/pin_put.dart';
import '../../constants/app_constants.dart';
import '../../core/components/text/low_text.dart';
import '../../core/components/textfield/custom_textfield.dart';
import '/core/base/state/base_state.dart';
import '/core/base/view/base_view.dart';
import 'viewmodel/login_viewmodel.dart';

part 'subviews/verify_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  late LoginViewModel loginViewModel;
  TextEditingController countryCodeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController pinPutController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BaseView(
      onModelReady: (context, model) {
        loginViewModel = model as LoginViewModel;
        loginViewModel.context = context;
      },
      onDispose: () {
        countryCodeController.dispose();
        phoneNumberController.dispose();
        pinPutController.dispose();
      },
      viewModel: LoginViewModel(),
      onPageBuilder: (context) => buildScaffold(),
    );
  }

  Widget buildScaffold() => GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                left: context.extraHighPadding,
                right: context.extraHighPadding,
                top: context.dynamicHeight(0.05),
                bottom: context.extraHighPadding,
              ),
              child: Observer(
                builder: (context) => !loginViewModel.isCodeSended ? loginView() : verifyView(),
              ),
            ),
          ),
        ),
      );

  Column loginView() {
    return Column(
      children: [
        logo(),
        context.highSizedBoxHeight,
        loginTitleText(LocaleKeys.loginTitle.locale),
        context.highSizedBoxHeight,
        loginSubtitleText(),
        context.highSizedBoxHeight,
        Expanded(
          child: countryAndPhoneNumberFields(),
        ),
        takeCodeWithSmsButton(),
        context.normalSizedBoxHeight,
        takeCodeWithWhatsAppButton(),
        context.highSizedBoxHeight,
        privacyAndTermsRichText()
      ],
    );
  }

  SvgPicture logo() => SvgPicture.asset(ApplicationConstants.kiramkolayLogo, width: context.dynamicWidth(0.35));

  HighText loginTitleText(String text) {
    return HighText(
      text,
      bold: true,
    );
  }

  NormalText loginSubtitleText() {
    return NormalText(
      LocaleKeys.loginSubTitle.locale,
      textAlign: TextAlign.center,
      color: context.defaultTextColor.withOpacity(0.6),
    );
  }

  Column countryAndPhoneNumberFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: CustomTextField(
                controller: countryCodeController,
                onTap: () {
                  showSelectionAlertDialog(
                      context: context,
                      onSelect: (countryCode) {
                        if (countryCode.dialCode != null) {
                          countryCodeController.text = countryCode.dialCode!;
                        }
                      });
                },
                keyboardType: TextInputType.none,
                hintText: LocaleKeys.countryCode.locale,
              ),
            ),
            context.highSizedBoxWidth,
            Expanded(
              flex: 2,
              child: CustomTextField(
                controller: phoneNumberController,
                maxLength: 10,
                hintText: LocaleKeys.phoneNumber.locale,
                keyboardType: TextInputType.phone,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
          ],
        ),
        context.lowSizedBoxHeight,
        LowText(
          LocaleKeys.takeCodeExplaining.locale,
          color: context.defaultTextColor.withOpacity(0.6),
        )
      ],
    );
  }

  CustomButton takeCodeWithSmsButton() {
    return CustomButton(
      onPressed: () {
        if (countryCodeController.text.isNotEmpty) {
          if (phoneNumberController.text.length == 10) {
            loginViewModel.changeIsCodeSended(true);
          } else {
            Fluttertoast.showToast(msg: 'Invalid phone number');
          }
        } else {
          Fluttertoast.showToast(msg: 'Select a country code');
        }
      },
      title: LocaleKeys.takeCodeWithSms.locale,
      icon: Icons.question_answer,
      padding: EdgeInsets.all(context.highPadding),
    );
  }

  CustomOutlinedButton takeCodeWithWhatsAppButton() {
    return CustomOutlinedButton(
      onPressed: () {},
      title: LocaleKeys.takeCodeWithWhatsapp.locale,
      fontWeight: FontWeight.w600,
      icon: FontAwesomeIcons.whatsapp,
      padding: EdgeInsets.all(context.highPadding),
    );
  }

  Text privacyAndTermsRichText() {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(text: 'Devam ederek '),
          TextSpan(
            text: 'Kullan??m Ko??ullar??n??',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: context.theme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const TextSpan(text: '\nve '),
          TextSpan(
            text: 'Gizlilik Politikas??n??',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: context.theme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const TextSpan(text: ' kabul'),
          const TextSpan(text: '\netmi?? olursunuz.'),
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
}
