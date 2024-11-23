import 'package:flutter/material.dart';
import 'package:news/sources/data/data_sources/sources_data_sources.dart';
import 'package:news/sources/data/models/source.dart';

class SourcesViewModel with ChangeNotifier {
  final dataSource = SourcesDataSources();
  List<Source> source = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> getSources(String categoryId) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await dataSource.getSources(categoryId);
      if (response.status == 'ok' && response.sources != null) {
        source = response.sources!;
      } else {
        errorMessage = 'Faild to get sources';
      }
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
