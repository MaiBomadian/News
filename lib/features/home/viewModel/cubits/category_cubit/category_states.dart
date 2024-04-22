import '../../../../../models/source_model.dart';

sealed class CategoryStates {}

class LoadingCategoryState extends CategoryStates {}

class SuccessCategoryState extends CategoryStates {
  List<SourceModel> sourcesList;

  SuccessCategoryState(this.sourcesList);
}

class FailureCategoryState extends CategoryStates {
  String? errorMessage;
  FailureCategoryState({
    this.errorMessage,
  });
}
