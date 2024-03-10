import 'package:flutter/material.dart';
import 'package:news_app/core/config/constants.dart';
import 'package:news_app/core/widgets/custom_background_widget.dart';
import 'package:news_app/core/widgets/custom_drawer.dart';
import 'package:news_app/features/home/widgets/category_item_widget.dart';
import 'package:news_app/main.dart';

import '../../../models/category_model.dart';
import 'category_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<CategoryModel> categoriesList = [
    CategoryModel(
      id: 'Sports',
      title: 'Sports',
      image: 'assets/images/sports.png',
      backgroundColor: const Color(0xffC91C22),
    ),
    CategoryModel(
        id: 'Politics',
        title: 'Politics',
        image: 'assets/images/Politics.png',
        backgroundColor: const Color(0xff003E90)),
    CategoryModel(
        id: 'Health',
        title: 'Health',
        image: 'assets/images/health.png',
        backgroundColor: const Color(0xffED1E79)),
    CategoryModel(
      id: 'Business',
      title: 'Business',
      image: 'assets/images/bussines.png',
      backgroundColor: const Color(0xffCF7E48),
    ),
    CategoryModel(
      id: 'Environment',
      title: 'Environment',
      image: 'assets/images/environment.png',
      backgroundColor: const Color(0xff4882CF),
    ),
    CategoryModel(
      id: 'Science',
      title: 'Science',
      image: 'assets/images/3x/science.png',
      backgroundColor: const Color(0xffF2D352),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            selectCategory == null ? 'News App' : selectCategory!.title,
            style: Constants.theme.textTheme.titleLarge,
          ),
        ),
        drawer: CustomDrawer(
          onDrawerTapped: onDrawerClicked,
        ),
        body: selectCategory == null
            ? Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Pick your category \n of interest',
                      style: Constants.theme.textTheme.bodyLarge?.copyWith(
                          color: const Color(0xff4F5A69),
                          fontWeight: FontWeight.w700,
                          height: 1.15),
                    ),
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20,
                                childAspectRatio: 5 / 6),
                        itemBuilder: (context, index) => CategoryItemWidget(
                          index: index,
                          categoryModel: categoriesList[index],
                          onCategoryClicked: onCategoryTapped,
                        ),
                        itemCount: 6,
                      ),
                    ),
                  ],
                ),
              )
            : CategoryView(
                categoryModel: selectCategory!,
              ),
      ),
    );
  }

  CategoryModel? selectCategory;

  void onCategoryTapped(CategoryModel categoryModel) {
    selectCategory = categoryModel;
    setState(() {});
  }

  void onDrawerClicked() {
    setState(() {
      selectCategory = null;
    });
    navigatorKey.currentState!.pop();
  }
}
