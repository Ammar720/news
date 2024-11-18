import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  final void Function(DrawerItem) onItemSelected;

  const HomeDrawer({
    super.key,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width * 0.7,
      child: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            height: screenSize.height * 0.2,
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(50),
            child: Text('News App!',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: AppTheme.whiteColor)),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => (onItemSelected (DrawerItem.categories)),
                    child: Row(
                      children: [
                        const Icon(Icons.menu),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Categories',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () => (onItemSelected (DrawerItem.settings)),
                    child: Row(
                      children: [
                        const Icon(Icons.settings),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Setting',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum DrawerItem{
  categories,
  settings
}
