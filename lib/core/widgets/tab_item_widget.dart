import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/config/constants.dart';
import 'package:news_app/models/source_model.dart';

class TabItemWidget extends StatelessWidget {
  final SourceModel sourceModel;
  final bool isSelected;

  const TabItemWidget(
      {Key? key, required this.sourceModel, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: isSelected ? Constants.theme.primaryColor : Colors.transparent,
        border: Border.all(
          color: Constants.theme.primaryColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        sourceModel.name,
        style: Constants.theme.textTheme.bodyMedium?.copyWith(
          color: isSelected ? Colors.white : Constants.theme.primaryColor,
        ),
      ),
    );
  }
}
