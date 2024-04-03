import 'package:flutter/material.dart';
import 'package:news_app/core/config/application_theme_manager.dart';
import 'package:news_app/core/config/pages_route_name.dart';
import 'package:news_app/core/config/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/core/config/setting_provider.dart';
import 'package:provider/provider.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => SettingProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingProvider>(context);
    return MaterialApp(
      locale: Locale(vm.currentLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ApplicationThemeManager.applicationThemeData,
      initialRoute: PagesRouteName.initial,
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
