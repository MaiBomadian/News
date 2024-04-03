import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/custom_background_widget.dart';
import 'package:news_app/core/widgets/news_list_widget.dart';
import 'package:news_app/features/home/viewModel/category_view_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/network/api_manager.dart';
import 'package:provider/provider.dart';

class CategoryView extends StatefulWidget {
  final CategoryModel categoryModel;

  const CategoryView({Key? key, required this.categoryModel}) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  var viewModel = CategoryViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getDataSource(widget.categoryModel);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CategoryViewModel>(
      create: (BuildContext context) => viewModel,
      child: Consumer<CategoryViewModel>(builder: (context, viewModel, child) {
        if (viewModel.sourcesList.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return CustomBackgroundWidget(
          child: NewsListWidget(sourcesList: viewModel.sourcesList),
        );
      }),
    );

    // FutureBuilder(
    //     future: ApiManager.fetchDataSources(categoryModel),
    //     builder: (context, snapshot) {
    //       if (snapshot.hasError) {
    //         return const Center(
    //           child: Text('Something went wrong'),
    //         );
    //       }
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }
    //       var sourcesList = snapshot.data ?? [];
    //       return NewsListWidget(sourcesList: sourcesList);
    //
    //       //   ListView.builder(
    //       //   itemCount: sourcesList.length,
    //       //   itemBuilder: (context, index) => Center(
    //       //     child: Text(
    //       //       sourcesList[index].name,
    //       //       style: Constants.theme.textTheme.bodyLarge?.copyWith(
    //       //         color: Colors.black,
    //       //       ),
    //       //     ),
    //       //   ),
    //       // );
    //     }),
  }
}
