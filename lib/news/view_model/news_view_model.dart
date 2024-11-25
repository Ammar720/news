import 'package:flutter/material.dart';
import 'package:news/news/data/models/article.dart';
import 'package:news/news/data/repository/news_repository.dart';
import 'package:news/shared/service_locator.dart';

class NewsViewModel with ChangeNotifier {
  late final NewsRepository repository;
  NewsViewModel() {
    repository = NewsRepository( ServiceLocator.newsDataSource);
  }
  List<Article> news = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> getNews(String categoryId) async {
    isLoading = true;
    notifyListeners();
    try {
      news = await repository.getNews(categoryId);
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
