import 'package:flutter/material.dart';
import 'package:news/categories/categories_grid.dart';
import 'package:news/categories/category_details.dart';
import 'package:news/drawer/home_drawer.dart';
import 'package:news/models/category_model.dart';
import 'package:news/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DrawerItem selectedDrawerItem = DrawerItem.categories;
  CategoryModel? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/images/pattern.png'),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            selectedCategory != null
                ? selectedCategory!.label
                : selectedDrawerItem == DrawerItem.categories
                    ? 'News App'
                    : 'Settings',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        drawer: HomeDrawer(
          onItemSelected: onDrawerItemSelected,
        ),
        body: selectedCategory != null
            ? CategoryDetails(
                categoryId: selectedCategory!.id,
              )
            : selectedDrawerItem == DrawerItem.categories
                ? CategoriesGrid(selectedCategoryModel: onCategorySelected)
                : const SettingsTab(),
      ),
    );
  }

  void onDrawerItemSelected(DrawerItem item) {
    selectedDrawerItem = item;
    selectedCategory = null;
    setState(() {});
    Navigator.pop(context);
  }

  void onCategorySelected(CategoryModel categoryModel) {
    selectedCategory = categoryModel;
    setState(() {});
  }
}
