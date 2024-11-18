import 'package:flutter/material.dart';

class CategoryDetails extends StatelessWidget {
  final String categoryId;
  const CategoryDetails( {super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Category Details'),
    );
  }
}
