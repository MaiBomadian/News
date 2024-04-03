import 'package:flutter/material.dart';
import 'package:news_app/core/config/setting_provider.dart';
import 'package:news_app/main.dart';
import 'package:provider/provider.dart';

class Constants {
  static var theme = Theme.of(navigatorKey.currentState!.context);
  static var mediaQuery =
      MediaQuery.of(navigatorKey.currentState!.context).size;
  static var vm =
      Provider.of<SettingProvider>(navigatorKey.currentState!.context);
  static const String apiKey = "25057c19ebfe42ea90e227d782eda0ed";
  static const String baseUrl = "newsapi.org";
}
