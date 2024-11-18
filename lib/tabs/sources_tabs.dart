import 'package:flutter/material.dart';
import 'package:news/models/source_model.dart';
import 'package:news/news/news_list.dart';
import 'package:news/tabs/tab_bar_item.dart';

class SourcesTabs extends StatefulWidget {
 final List<SourceModel> sources;
  const SourcesTabs({super.key, required this.sources});

  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            isScrollable: true,
            dividerColor: Colors.transparent,
            indicatorColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
            splashBorderRadius: BorderRadius.circular(25),
            onTap: (index) {
              currentIndex = index;
              setState(() {});
            },
            tabs: widget.sources
                .map(
                  (source) => TabBarItem(
                    sourceName: source.name,
                    isSelected: widget.sources.indexOf(source) == currentIndex,
                  ),
                )
                .toList(),
          ),
        ),
        const Expanded(
          child: NewsList(),
        )
      ],
    );
  }
}
