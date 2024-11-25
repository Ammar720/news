import 'dart:convert';
import 'package:news/shared/api_constants.dart';
import 'package:news/sources/data/data_sources/sources_data_source.dart';
import 'package:news/sources/data/models/source.dart';
import 'package:news/sources/data/models/sources_response.dart';
import 'package:http/http.dart' as http;

class SourcesAPIDataSources extends SourcesDataSource {
  @override
  Future<List<Source>> getSources(String categoryId) async {
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

    final sourcesResponse = SourcesResponse.fromJson(json);
    if (sourcesResponse.status == 'ok' && sourcesResponse.sources != null) {
      return sourcesResponse.sources!;
    } else {
      throw Exception('Faild to get sources');
    }
  }
}
