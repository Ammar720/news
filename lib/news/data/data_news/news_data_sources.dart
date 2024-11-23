import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/news/data/models/news_response.dart';
import 'package:news/shared/api_constants.dart';

class NewsDataSources {
   Future<NewsResponse> getNews(String sourceId) async {
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

    return NewsResponse.fromJson(json);
  }
}
