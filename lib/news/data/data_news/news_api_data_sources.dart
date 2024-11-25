import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/news/data/data_news/news_data_source.dart';
import 'package:news/news/data/models/article.dart';
import 'package:news/news/data/models/news_response.dart';
import 'package:news/shared/api_constants.dart';

class NewsAPIDataSources extends NewsDataSource {
  @override
  Future<List<Article>> getNews(String sourceId) async {
    final uri = Uri.https(
      ApiConstants.baseUrl,
      ApiConstants.newsEndpoint,
      {
        'apiKey': ApiConstants.apiKeys,
        'sources': sourceId,
      },
    );

    final response = await http.get(uri);
    final json = jsonDecode(response.body);

    final newsResponse = NewsResponse.fromJson(json);
    if (newsResponse.status == 'ok' && newsResponse.articles != null) {
      return newsResponse.articles!;
    } else {
      throw Exception('Faild to get articles');
    }
  }
}
