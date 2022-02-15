import 'package:flutter/material.dart';
import '../../../view/home/home_view.dart';

import '../../base/view/not_found_navigaiton.dart';
import 'navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.homeView:
        return normalNavigate(const HomeView(), NavigationConstants.homeView);

      default:
        return MaterialPageRoute(builder: (context) => const NotFoundNavigationWidget());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(builder: (context) => widget, settings: RouteSettings(name: pageName));
  }
}
