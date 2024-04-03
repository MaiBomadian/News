import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/article_item_widget.dart';
import 'package:news_app/features/home/viewModel/article_view_model.dart';
import 'package:news_app/network/api_manager.dart';
import 'package:provider/provider.dart';

class ArticlesListWidget extends StatefulWidget {
  const ArticlesListWidget({Key? key, required this.sourceId})
      : super(key: key);
  final String sourceId;

  @override
  State<ArticlesListWidget> createState() => _ArticlesListWidgetState();
}

class _ArticlesListWidgetState extends State<ArticlesListWidget> {
  var viewModel = ArticleViewModel();

  @override
   void initState() {
    viewModel.getArticlesData(widget.sourceId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticleViewModel>(
      builder: (BuildContext context, viewModel, _) {
        if (viewModel.articlesList.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Expanded(
          child: ListView.builder(
            itemCount: viewModel.articlesList.length,
            itemBuilder: (context, index) => ArticleItemWidget(
              articles: viewModel.articlesList[index],
            ),
          ),
        );
      },
    );

    FutureBuilder(
      future: ApiManager.fetchDataArticles(widget.sourceId),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Something went wrong'),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        var articlesList = snapshot.data ?? [];
        return Expanded(
          child: ListView.builder(
            itemCount: articlesList.length,
            itemBuilder: (context, index) => ArticleItemWidget(
              articles: articlesList[index],
            ),
          ),
        );
      },
    );
  }
}
