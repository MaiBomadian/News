import '../../../../../models/article_data_model.dart';

sealed class ArticleStates {}

class LoadingArticleState extends ArticleStates {}

class SuccessArticleState extends ArticleStates {
  List<Articles> articlesList;

  SuccessArticleState(this.articlesList);
}

class FailureArticleState extends ArticleStates {
  String? errMessage;

  FailureArticleState({
    this.errMessage,
  });
}
