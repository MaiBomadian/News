import 'package:flutter/material.dart';
import 'package:news_app/core/config/constants.dart';
import 'package:news_app/models/category_model.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({Key? key, required this.index, required this.categoryModel}) : super(key: key);
  final int index;
 final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft:const Radius.circular(25),
          topRight:const Radius.circular(25),
          bottomRight: index %2 == 0 ? const Radius.circular(25): const Radius.circular(0),
          bottomLeft: index %2 == 0 ? const Radius.circular(0):const Radius.circular(25),
        ),
        color: categoryModel.backgroundColor
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(categoryModel.image,fit: BoxFit.cover,),
          Text(categoryModel.title,style: Constants.theme.textTheme.bodyMedium,),
        ],
      ),
    );
  }
}
