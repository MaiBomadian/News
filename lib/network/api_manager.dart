import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/config/constants.dart';
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
}
