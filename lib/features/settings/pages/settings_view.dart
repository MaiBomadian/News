import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/config/constants.dart';
import 'package:news_app/core/widgets/custom_background_widget.dart';
import 'package:news_app/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/config/pages_route_name.dart';
import '../../../core/widgets/custom_drawer.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

final List<String> languages = [
  'English',
  'عربي',
];

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    return CustomBackgroundWidget(
      child: Scaffold(
        drawer: CustomDrawer(
          onDrawerTapped: onDrawerClicked,
        ),
        appBar: AppBar(
          title: Text(
            locale.settings,
            style: Constants.theme.textTheme.bodyLarge,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                locale.language,
                style: Constants.theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff303030),
                ),
              ),
              const SizedBox(height: 20),
              CustomDropdown(
                decoration: CustomDropdownDecoration(
                  listItemStyle: Constants.theme.textTheme.bodySmall?.copyWith(
                    color: Constants.theme.primaryColor,
                  ),
                  closedSuffixIcon: Icon(Icons.keyboard_arrow_down,
                      color: Constants.theme.primaryColor),
                  closedBorder: Border.all(color: Constants.theme.primaryColor),
                  closedBorderRadius: BorderRadius.zero,
                  expandedBorderRadius: BorderRadius.zero,
                  headerStyle: Constants.theme.textTheme.bodySmall?.copyWith(
                    color: Constants.theme.primaryColor,
                  ),
                ),
                initialItem: Constants.vm.currentLanguage == 'en' ? 'English' : 'عربي',

                items: languages,
                onChanged: (value) {
                  if (value == 'English') {
                    Constants.vm.changeLanguage('en');
                  }
                  if (value == 'عربي') {
                    Constants.vm.changeLanguage('ar');
                  }

                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onDrawerClicked() {
    setState(() {});
    navigatorKey.currentState?.popAndPushNamed(PagesRouteName.homeView); //
  }
}
