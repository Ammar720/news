import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/categories/category_item.dart';
import 'package:news/models/category_model.dart';

class CategoriesGrid extends StatelessWidget {
  final void Function(CategoryModel categoryModel) selectedCategoryModel;
  const CategoriesGrid({super.key, required this.selectedCategoryModel});

  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> categories = [
      CategoryModel(
          id: 'sports',
          label: 'Sports',
          imageName: 'ball',
          color: AppTheme.redColor),
      CategoryModel(
          id: 'business',
          label: 'Business',
          imageName: 'business',
          color: AppTheme.orangeColor),
      CategoryModel(
          id: 'health',
          label: 'Health',
          imageName: 'health',
          color: AppTheme.roseColor),
      CategoryModel(
          id: 'science',
          label: 'Science',
          imageName: 'science',
          color: AppTheme.yellow),
      CategoryModel(
          id: 'sports',
          label: 'sports',
          imageName: 'ball',
          color: AppTheme.redColor),
      CategoryModel(
          id: 'sports',
          label: 'sports',
          imageName: 'ball',
          color: AppTheme.redColor)
    ];
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
                  crossAxisCount: 2, childAspectRatio: 0.92),
              itemBuilder: (_, index) => InkWell(
                splashColor: Colors.white,
                onTap: () => (selectedCategoryModel(categories[index])),
                child: CategoryItem(
                  index: index,
                  category: categories[index],
                ),
              ),
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}
