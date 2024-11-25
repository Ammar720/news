import 'package:news/news/data/data_news/news_data_source.dart';
import 'package:news/news/data/models/article.dart';

class NewsRepository {
  final NewsDataSource dataSource;
  NewsRepository(this.dataSource);

  Future<List<Article>> getNews(String sourceId) async {
    return dataSource.getNews(sourceId);
  }
}