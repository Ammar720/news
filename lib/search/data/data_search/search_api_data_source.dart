import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/news/data/models/article.dart';
import 'package:news/news/data/models/news_response.dart';
import 'package:news/search/data/data_search/search_data_source.dart';
import 'package:news/shared/api_constants.dart';

class SearchApiDataSource extends SearchDataSource {
  @override
  Future<List<Article>> getNews(String queryValue, {int page = 1}) async {
    final uri = Uri.https(
      ApiConstants.baseUrl,
      ApiConstants.newsEndpoint,
      {
        'apiKey': ApiConstants.apiKeys,
        'q': queryValue,
        'page': page.toString(),
        'pageSize': '10', 
      },
    );

    final response = await http.get(uri);
    final json = jsonDecode(response.body);

    final newsResponse = NewsResponse.fromJson(json);
    if (newsResponse.status == 'ok' && newsResponse.articles != null) {
      return newsResponse.articles!;
    } else {
      throw Exception('Failed to get articles');
    }
  }
}

