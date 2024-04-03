import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/config/constants.dart';
import 'package:news_app/models/article_data_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/source_model.dart';

class ApiManager {
  static Future<List<SourceModel>> fetchDataSources(
      CategoryModel categoryModel) async {
    var url = Uri.https(
      Constants.baseUrl,
      '/v2/top-headlines/sources',
      {
        'apiKey': Constants.apiKey,
        'category': categoryModel.id,
      },
    );
    var response = await http.get(url);

    List<SourceModel> sources = [];
    if (response.statusCode == 200) {
      // print(response.body);
      var data = jsonDecode(response.body);
      var sourcesList = data["sources"] as List;
      for (var element in sourcesList) {
        sources.add(SourceModel.fromJSON(element));
      }
      return sources;
    } else {
      throw Exception('Failed to load album');
    }
  }

  static Future<List<Articles>> fetchDataArticles(String sourceId) async {
    Map<String, dynamic> query = {
      'apiKey': Constants.apiKey,
      'sources': sourceId,
    };
    var url = Uri.https(
      Constants.baseUrl,
      '/v2/everything',
      query,
    );
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);

      var data = jsonDecode(response.body);
      var articlesList = data["articles"] as List;
      List<Articles> articles = [];
      for (var e in articlesList) {
        articles.add(Articles.fromJson(e));
      }
      return articles;
    } else {

      throw Exception('Error fetching data articles');
    }
  }
}
