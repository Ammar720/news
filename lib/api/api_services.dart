import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/api/api_constants.dart';
import 'package:news/models/news_response/news_response.dart';
import 'package:news/models/sources_response/sources_response.dart';

class ApiServices {
  static Future<SourcesResponse> getSources(String categoryId) async {
    final uri = Uri.https(
      ApiConstants.baseUrl,
      ApiConstants.sourcesEndpoint,
      {
        'apiKey': ApiConstants.apiKeys,
        'category': categoryId,
      },
    );

    final response = await http.get(uri);
    final json = jsonDecode(response.body);

    return SourcesResponse.fromJson(json);
  }

  static Future<NewsResponse> getNews(String sourceId) async {
    final uri = Uri.parse('https://newsapi.org/v2/top-headlines?sources=$sourceId&apiKey=66406032a5bb4921a6306cceab447ad1');
    //  Uri.https(
    //   ApiConstants.baseUrl,
    //   ApiConstants.newsEndpoint,
    //   {
    //     'apiKey': ApiConstants.apiKeys,
    //     'sources': sourceId,
    //   },
    // );

    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    

    return  NewsResponse.fromJson(json);
  }
}
