import 'package:flutter/material.dart';
import '/core/base/state/base_state.dart';
import '/core/base/view/base_view.dart';
import 'viewmodel/home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> {
  late HomeViewModel homeViewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView(
      onModelReady: (context, model) {
        homeViewModel = model as HomeViewModel;
        homeViewModel.context = context;
      },
      viewModel: HomeViewModel(),
      onPageBuilder: (context) => buildScaffold(),
    );
  }

  Scaffold buildScaffold() => Scaffold(
        body: Container(),
      );
}
