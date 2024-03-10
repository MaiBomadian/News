import 'package:flutter/material.dart';
import 'package:news_app/main.dart';

class Constants {
  static var theme = Theme.of(navigatorKey.currentState!.context);
  static var mediaQuery = MediaQuery.of(navigatorKey.currentState!.context).size;

  static const String apiKey = "25057c19ebfe42ea90e227d782eda0ed";
  static const String baseUrl = "newsapi.org";
}
