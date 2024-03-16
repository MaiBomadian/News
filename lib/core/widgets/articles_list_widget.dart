import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/article_item_widget.dart';
import 'package:news_app/network/api_manager.dart';

class ArticlesListWidget extends StatelessWidget {
  const ArticlesListWidget({Key? key, required this.sourceId})
      : super(key: key);
  final String sourceId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.fetchDataArticles(sourceId),
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
// CachedNetworkImage(
// imageUrl: "http://via.placeholder.com/200x150",
// imageBuilder: (context, imageProvider) => Container(
// decoration: BoxDecoration(
// image: DecorationImage(
// image: imageProvider,
// fit: BoxFit.cover,
// colorFilter:
// ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
// ),
// ),
// placeholder: (context, url) => CircularProgressIndicator(),
// errorWidget: (context, url, error) => Icon(Icons.error),
// ),