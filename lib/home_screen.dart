import 'package:flutter/material.dart';
import 'package:news/categories/categories_grid.dart';
import 'package:news/drawer/home_drawer.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';

  const HomeScreen({super.key});
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
            'News App',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        drawer: const HomeDrawer(),
        body:const CategoriesGrid()
      ),
    );
  }
}
