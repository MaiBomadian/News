import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/network/api_manager.dart';

class CategoryViewModel extends ChangeNotifier {
  List<SourceModel> _sourcesList = [];

  List<SourceModel> get sourcesList => _sourcesList;

  getDataSource(CategoryModel categoryModel) async {
    try {
      _sourcesList = await ApiManager.fetchDataSources(categoryModel);
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}
