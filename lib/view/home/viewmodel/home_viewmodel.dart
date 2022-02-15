import 'package:mobx/mobx.dart';
import 'package:flutter/cupertino.dart';
part 'home_viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  late BuildContext context;
}
