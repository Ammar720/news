import 'package:news/news/data/models/article.dart';

abstract class SearchDataSource {
  Future<List<Article>> getNews(String queryValue ,{int page = 1});
}