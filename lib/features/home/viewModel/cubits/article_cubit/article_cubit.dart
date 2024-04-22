import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/viewModel/cubits/article_cubit/article_state.dart';
import 'package:news_app/network/api_manager.dart';

class ArticleCubit extends Cubit<ArticleStates> {
  ArticleCubit() : super(LoadingArticleState());

  getDataArticle(String sourceId) async {
    emit(LoadingArticleState());
    try {
      var articlesList = await ApiManager.fetchDataArticles(sourceId);
      emit(SuccessArticleState(articlesList));
    } catch (error) {
      emit(
        FailureArticleState(
          errMessage: error.toString(),
        ),
      );
      print(error.toString());
    }
  }
}
