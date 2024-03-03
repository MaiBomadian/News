import 'package:flutter/material.dart';
import 'package:news_app/core/config/pages_route_name.dart';
import 'package:news_app/features/home/pages/home_view.dart';
import 'package:news_app/features/settings/pages/settings_view.dart';
import 'package:news_app/features/splash/pages/splash_view.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case PagesRouteName.initial:
        return MaterialPageRoute(
            builder: (context) => const SplashView(), settings: routeSettings);
      case PagesRouteName.homeView:
        return MaterialPageRoute(
            builder: (context) =>  HomeView(), settings: routeSettings);
      case PagesRouteName.settingView:
        return MaterialPageRoute(
            builder: (context) => const SettingsView(),
            settings: routeSettings);
      default:
        return MaterialPageRoute(
            builder: (context) => const SplashView(), settings: routeSettings);
    }
  }
}
