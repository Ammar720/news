import 'package:flutter/material.dart';
import 'package:news/api/api_services.dart';

import 'package:news/news/news_item.dart';
import 'package:news/widgets/error_indicator.dart';
import 'package:news/widgets/loading_indicator.dart';

class NewsList extends StatelessWidget {
  const NewsList({
    super.key,
    required this.sourceId,
  });
  final String sourceId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiServices.getNews(sourceId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return const ErrorIndicator();
        } else {
          final articles = snapshot.data?.articles ?? [];
          return ListView.builder(
            itemBuilder: (context, index) => NewsItem(article: articles[index]),
            itemCount: articles.length,
          );
        }
      },
    );
  }
}
