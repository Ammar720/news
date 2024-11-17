import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/categories/category_item.dart';
import 'package:news/models/category_model.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = List.generate(
        6,
        (index) => CategoryModel(
            id: '$index',
            label: 'sports',
            imageName: 'ball',
            color: AppTheme.redColor));
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 25,
        horizontal: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pick your category of interest',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.92
              ),
              itemBuilder: (_, index) => CategoryItem(
                index: index,
                category: categories[index],
              ),
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}
