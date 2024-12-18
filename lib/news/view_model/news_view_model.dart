import 'package:flutter/material.dart';
import 'package:news/news/data/models/article.dart';
import 'package:news/news/data/repository/news_repository.dart';
import 'package:news/shared/service_locator.dart';

class NewsViewModel with ChangeNotifier {
  late final NewsRepository repository;
  NewsViewModel() {
    repository = NewsRepository(ServiceLocator.newsDataSource);
  }
  List<Article> news = [];
  bool isLoading = false;
  String? errorMessage;
  int currentPage = 1;
  bool hasMore = true;

  Future<void> getNews(String categoryId, {bool isPagination = false}) async {
    if (isPagination && isLoading) return;

    isLoading = true;
    notifyListeners();
    try {
      final fetchedNews =
          await repository.getNews(categoryId, page: currentPage);
      if (fetchedNews.isEmpty) {
        hasMore = false;
      } else {
        if (isPagination) {
          news.addAll(fetchedNews);
        } else {
          news = fetchedNews;
        }
        currentPage++;
      }
    } catch (error) {
      errorMessage = error.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
