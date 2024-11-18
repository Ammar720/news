import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';

class TabBarItem extends StatelessWidget {
 final String sourceName;
 final bool isSelected;
 const TabBarItem({super.key, required this.sourceName, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color:
            isSelected ? Theme.of(context).primaryColor : AppTheme.whiteColor,
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 2
        ),
      ),
      child: Text(
        sourceName,
        style: TextStyle(
          color:
              isSelected ? AppTheme.whiteColor : Theme.of(context).primaryColor,
              fontSize: 14 ,
              fontWeight: FontWeight.w400
        ),
      ),
    );
  }
}
