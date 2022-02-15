import 'package:flutter/material.dart';
import 'package:kiramkolay/view/home/home_view.dart';
import 'package:kiramkolay/view/login/login_view.dart';
import 'package:kiramkolay/view/splash/viewmodel/splash_viewmodel.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late SplashViewModel _splashViewModel;
  @override
  Widget build(BuildContext context) {
    _splashViewModel = context.watch<SplashViewModel>();
    if (_splashViewModel.isUserLoggedIn) {
      return const HomeView();
    } else {
      return const LoginView();
    }
  }
}
