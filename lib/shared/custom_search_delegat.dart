import 'package:flutter/material.dart';
import 'package:news/search/view/widgets/searched_news_list.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Text(
          'Please enter a search term',
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      );
    }
    return SearchedNewsList(queryValue: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Text(
          'Start typing to see suggestions',
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      );
    }
    return SearchedNewsList(queryValue: query);
  }
}
