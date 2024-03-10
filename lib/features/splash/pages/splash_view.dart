import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/core/config/pages_route_name.dart';
import 'package:news_app/core/widgets/custom_background_widget.dart';
import 'package:news_app/features/home/pages/home_view.dart';
import 'package:news_app/main.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(
      (const Duration(seconds: 3)),
      () => navigatorKey.currentState!
          .pushReplacementNamed(PagesRouteName.homeView),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: Image.asset('assets/images/logo.png'),
    );
  }
}
