import 'package:flutter/material.dart';
import 'package:news_app/models/article_data_model.dart';
import 'package:news_app/network/api_manager.dart';

class ArticleViewModel extends ChangeNotifier {
  List<Articles> _articlesList = [];

  List<Articles> get articlesList => _articlesList;

  getArticlesData(String sourceId) async {
    try {
      _articlesList = await ApiManager.fetchDataArticles(sourceId);
      notifyListeners();
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }
}
