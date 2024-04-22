import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/network/api_manager.dart';

import '../../../../../models/category_model.dart';
import 'category_states.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit() : super(LoadingCategoryState());

  getDataSource(CategoryModel categoryModel) async {
    emit(LoadingCategoryState());
    try {
      var sourcesList = await ApiManager.fetchDataSources(categoryModel);
      emit(
        SuccessCategoryState(sourcesList),
      );
    } catch (error) {
      emit(
        FailureCategoryState(
          errorMessage: error.toString(),
        ),
      );
      print(error.toString());
    }
  }
}
