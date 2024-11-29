import 'package:news/news/data/models/article.dart';
import 'package:news/search/data/data_search/search_data_source.dart';

class SearchRepository {
  final SearchDataSource dataSource;
  SearchRepository(this.dataSource);

  Future<List<Article>> getNews(String queryValue, {int page = 1}) {
    return dataSource.getNews(queryValue, page: page);
  }
}
