import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/widgets/article_item_widget.dart';
import 'package:news_app/features/home/viewModel/article_view_model.dart';
import 'package:news_app/features/home/viewModel/cubits/article_cubit/article_cubit.dart';
import 'package:news_app/features/home/viewModel/cubits/article_cubit/article_state.dart';
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
  var cubitArticleModel = ArticleCubit();

  @override
  void initState() {
    cubitArticleModel.getDataArticle(widget.sourceId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Consumer<ArticleViewModel>(
    //   builder: (BuildContext context, viewModel, _) {
    //     if (viewModel.articlesList.isEmpty) {
    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }
    return BlocBuilder<ArticleCubit, ArticleStates>(
        bloc: cubitArticleModel,
        builder: (context, state) {
          switch (state) {
            case LoadingArticleState():
              {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            case FailureArticleState():
              {
                return Text(state.errMessage.toString());
              }
            case SuccessArticleState():
              {
                var articles = state.articlesList;
                return Expanded(
                  child: ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (context, index) => ArticleItemWidget(
                      articles: articles[index],
                    ),
                  ),
                );
              }
          }
        });
    // Using Provider

    //   Expanded(
    //     child: ListView.builder(
    //       itemCount: viewModel.articlesList.length,
    //       itemBuilder: (context, index) => ArticleItemWidget(
    //         articles: viewModel.articlesList[index],
    //       ),
    //     ),
    //   );
    // // },
    // );

    // FutureBuilder(
    //   future: ApiManager.fetchDataArticles(widget.sourceId),
    //   builder: (BuildContext context, snapshot) {
    //     if (snapshot.hasError) {
    //       return const Center(
    //         child: Text('Something went wrong'),
    //       );
    //     }
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }
    //     var articlesList = snapshot.data ?? [];
    //     return Expanded(
    //       child: ListView.builder(
    //         itemCount: articlesList.length,
    //         itemBuilder: (context, index) => ArticleItemWidget(
    //           articles: articlesList[index],
    //         ),
    //       ),
    //     );
    //   },
    // );
  }
}
