import 'package:flutter/material.dart';
import 'package:news/news/data/data_news/news_data_sources.dart';
import 'package:news/news/data/models/article.dart';

class NewsViewModel with ChangeNotifier{
  final dataSource = NewsDataSources();
  List<Article> news = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> getNews(String categoryId) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await dataSource.getNews(categoryId);
      if (response.status == 'ok' && response.articles != null) {
        news = response.articles!;
      } else {
        errorMessage = 'Faild to get news';
      }
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
  
}