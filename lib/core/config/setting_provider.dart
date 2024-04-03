import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier{
  String currentLanguage = 'en';

  changeLanguage(String language){
    if(currentLanguage== language) return;
    currentLanguage = language;
    notifyListeners();
  }
}