import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';
class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, 
    required this.category,
    required this.index,
  });
  final CategoryModel category;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.only(bottom: 10,top: 8),
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20),
          topRight: const Radius.circular(20),
          bottomLeft: index.isOdd ? const Radius.circular(0):const Radius.circular(20),
          bottomRight: index.isEven ? const Radius.circular(0):const Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Image.asset('assets/images/${category.imageName}.png',),
          const Spacer(),
          Text(
            category.label,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}