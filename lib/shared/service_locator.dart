import 'package:news/news/data/data_news/news_api_data_sources.dart';
import 'package:news/news/data/data_news/news_data_source.dart';
import 'package:news/sources/data/data_sources/sources_API_data_sources.dart';
import 'package:news/sources/data/data_sources/sources_data_source.dart';

class ServiceLocator {
  static SourcesDataSource sourcesDataSource = SourcesAPIDataSources();
  static NewsDataSource newsDataSource = NewsAPIDataSources(); 
}