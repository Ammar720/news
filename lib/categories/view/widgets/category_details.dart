import 'package:flutter/material.dart';
import 'package:news/sources/view/widgets/sources_tabs.dart';
import 'package:news/shared/widgets/error_indicator.dart';
import 'package:news/shared/widgets/loading_indicator.dart';
import 'package:news/sources/view_model/sources_view_model.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  final String categoryId;
  const CategoryDetails({super.key, required this.categoryId});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  final viewModel = SourcesViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.getSources(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<SourcesViewModel>(
        builder: (_, viewModel, __) {
          if (viewModel.isLoading == true) {
            return const LoadingIndicator();
          } else if (viewModel.errorMessage != null) {
            return ErrorIndicator(errorMessage: viewModel.errorMessage!);
          } else {
            return SourcesTabs(sources: viewModel.source);
          }
        },
      ),
    );
  }
}
