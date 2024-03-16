import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/config/constants.dart';
import 'package:news_app/models/article_data_model.dart';

class ArticleItemWidget extends StatelessWidget {
  const ArticleItemWidget({Key? key, required this.articles}) : super(key: key);
  final Articles articles;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(15),
            ),
            child: CachedNetworkImage(
              imageUrl: articles.urlToImage ?? '',
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                size: 40,
                color: Colors.grey,
              ),
            ),
          ),
          // ClipRRect(
          //     borderRadius: BorderRadius.circular(10),
          //     child: Image.network(articles.urlToImage ?? '')),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              articles.source?.name ?? '',
              style: Constants.theme.textTheme.bodySmall
                  ?.copyWith(color: const Color(0xff79828B)),
              textAlign: TextAlign.start,
            ),
          ),
          Text(
            articles.title ?? '',
            style: Constants.theme.textTheme.bodyMedium
                ?.copyWith(color: const Color(0xff42505C), height: 1),
            textAlign: TextAlign.start,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Text(
              articles.publishedAt ?? '',
              style: Constants.theme.textTheme.displayLarge?.copyWith(
                color: const Color(0xffA3A3A3),
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
