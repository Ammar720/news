import 'package:flutter/material.dart';
import 'package:news/news/view/screens/news_details.dart';
import 'package:news/search/view/widgets/search_item.dart';
import 'package:news/search/view_model/search_view_model.dart';
import 'package:provider/provider.dart';
import 'package:news/shared/widgets/error_indicator.dart';
import 'package:news/shared/widgets/loading_indicator.dart';

class SearchedNewsList extends StatefulWidget {
  final String queryValue;
  const SearchedNewsList({super.key, required this.queryValue});

  @override
  State<SearchedNewsList> createState() => _SearchedNewsListState();
}

class _SearchedNewsListState extends State<SearchedNewsList> {
  final viewModel = SearchViewModel();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    viewModel.getNews(widget.queryValue);

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          viewModel.hasMore) {
        viewModel.getNews(widget.queryValue, isPagination: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Consumer<SearchViewModel>(
        builder: (_, viewModel, __) {
          if (viewModel.isLoading && viewModel.news.isEmpty) {
            return const LoadingIndicator();
          } else if (viewModel.errorMessage != null) {
            return ErrorIndicator(errorMessage: viewModel.errorMessage!);
          } else {
            return ListView.builder(
              controller: scrollController,
              itemCount: viewModel.news.length + (viewModel.hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == viewModel.news.length) {
                  return const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      NewsDetails.routeName,
                      arguments: viewModel.news[index],
                    );
                  },
                  child: SearchItem(
                    article: viewModel.news[index],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
