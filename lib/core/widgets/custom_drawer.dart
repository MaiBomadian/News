import 'package:flutter/material.dart';
import 'package:news_app/core/config/constants.dart';
import 'package:news_app/core/config/pages_route_name.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../main.dart';

class CustomDrawer extends StatelessWidget {
  final Function onDrawerTapped;

  const CustomDrawer({Key? key, required this.onDrawerTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(navigatorKey.currentState!.context)!;
    return Container(
      width: Constants.mediaQuery.width * .8,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50),
            height: 140,
            color: Constants.theme.primaryColor,
            child: Text(
              'News App!',
              textAlign: TextAlign.center,
              style: Constants.theme.textTheme.titleLarge,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: () {
              onDrawerTapped();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.list,
                    size: 40,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    locale.categories,
                    style: Constants.theme.textTheme.titleLarge?.copyWith(
                      color: const Color(0xff303030),
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              navigatorKey.currentState?.pushNamed(PagesRouteName.settingView);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.settings,
                    size: 40,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    locale.settings,
                    style: Constants.theme.textTheme.titleLarge?.copyWith(
                      color: const Color(0xff303030),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
