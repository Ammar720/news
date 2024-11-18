import 'package:flutter/material.dart';
import 'package:news/models/source_model.dart';
import 'package:news/tabs/sources_tabs.dart';

class CategoryDetails extends StatefulWidget {
  final String categoryId;
  const CategoryDetails({super.key, required this.categoryId});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  List<SourceModel> sources = List.generate(
    10,
    (index) => SourceModel(id: '$index', name: 'source name $index'),
  );
  @override
  Widget build(BuildContext context) {
    return SourcesTabs(sources: sources);
  }
}
