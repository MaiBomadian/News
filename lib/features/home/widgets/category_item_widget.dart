import 'package:flutter/material.dart';
import 'package:news_app/core/config/constants.dart';
import 'package:news_app/models/category_model.dart';

typedef OnCategoryClicked = void Function(CategoryModel)?;

class CategoryItemWidget extends StatelessWidget {
  final int index;
  final CategoryModel categoryModel;
  final OnCategoryClicked onCategoryClicked;

  const CategoryItemWidget(
      {Key? key,
      required this.index,
      required this.categoryModel,
      this.onCategoryClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onCategoryClicked == null) return;
        onCategoryClicked!(categoryModel);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(25),
              topRight: const Radius.circular(25),
              bottomRight: index % 2 == 0
                  ? const Radius.circular(25)
                  : const Radius.circular(0),
              bottomLeft: index % 2 == 0
                  ? const Radius.circular(0)
                  : const Radius.circular(25),
            ),
            color: categoryModel.backgroundColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              categoryModel.image,
              fit: BoxFit.cover,
            ),
            Text(
              categoryModel.title,
              style: Constants.theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
