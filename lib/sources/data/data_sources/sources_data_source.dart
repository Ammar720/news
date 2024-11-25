
import '../models/source.dart';

abstract class SourcesDataSource {
  Future<List<Source>> getSources(String categoryId);
}
