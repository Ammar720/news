import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String label;
  final String imageName;
  final Color color;

  const CategoryModel({
    required this.id,
    required this.label,
    required this.imageName,
    required this.color,
  });
}
