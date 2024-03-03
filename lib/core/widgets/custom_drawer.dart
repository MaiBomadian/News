import 'package:flutter/material.dart';
import 'package:news_app/core/config/constants.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          const SizedBox(height: 25,),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                const  Icon(
                    Icons.list,
                    size: 40,
                  ),
                  const SizedBox(width: 8,),

                  Text(
                    'Categories',
                    style: Constants.theme.textTheme.titleLarge?.copyWith(
                      color: const Color(0xff303030),
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                 const Icon(
                    Icons.settings,
                    size: 40,
                  ),
                  const SizedBox(width: 8,),

                  Text(
                    'Settings',
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
