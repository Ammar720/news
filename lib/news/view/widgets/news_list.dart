import 'package:flutter/material.dart';
import 'package:news/news/view/screens/news_details.dart';
import 'package:news/news/view/widgets/news_item.dart';
import 'package:news/news/view_model/news_view_model.dart';
import 'package:provider/provider.dart';
import 'package:news/shared/widgets/error_indicator.dart';
import 'package:news/shared/widgets/loading_indicator.dart';

class NewsList extends StatefulWidget {
  const NewsList({
    super.key,
    required this.sourceId,
  });
  final String sourceId;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final viewModel = NewsViewModel();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    viewModel.getNews(widget.sourceId);

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          viewModel.hasMore) {
        viewModel.getNews(widget.sourceId, isPagination: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    viewModel.getNews(widget.sourceId);

    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Consumer<NewsViewModel>(
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
                    return const LoadingIndicator();
                  }
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, NewsDetails.routeName,
                          arguments: viewModel.news[index]);
                    },
                    child: NewsItem(
                      article: viewModel.news[index],
                    ),
                  );
                });
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
