class ArticlesDataModel {
  final String? status;
  final List<Articles>? articles;

  ArticlesDataModel({
    required this.status,
    required this.articles,
  });

  factory ArticlesDataModel.fromJson(Map<String, dynamic> json) {
    return ArticlesDataModel(
      status: json['status'],
      articles: json['articles']??[],
    );
    // ArticlesDataModel.fromJson(dynamic json) {
    //   status = json['status'];
    //   if (json['articles'] != null) {
    //     articles = [];
    //     json['articles'].forEach((v) {
    //       articles?.add(Articles.fromJson(v));
    //     });
    //   }
    // }

  }
}

class Articles {
  final String? title;
  final String? description;
  final String? urlToImage;
  final String? publishedAt;
  final String? url;
  final Source? source;

  Articles({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.source,
  });

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      title: json["title"]?? '',
      description: json["description"],
      url: json["url"],
      urlToImage: json["urlToImage"]?? '',
      publishedAt: json["publishedAt"],
      source: Source.fromJson(json["source"]),
    );
  }
}

class Source {
  final String? id;
  final String? name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'],
    );
  }
}
