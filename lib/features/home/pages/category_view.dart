import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/custom_background_widget.dart';
import 'package:news_app/models/category_model.dart';

class CategoryView extends StatelessWidget {
 final CategoryModel categoryModel;
  const  CategoryView({Key? key, required this.categoryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomBackgroundWidget(
      child: Scaffold(),
    );
  }
}
