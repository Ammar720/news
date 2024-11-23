import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/models/news_response/article.dart';
import 'package:news/widgets/loading_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  final Article article;

  const NewsItem({super.key, required this.article});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: article.urlToImage ??
                  'https://th.bing.com/th/id/OIP.nKHjaZVhPgLKjjntUMpmXwHaHa?rs=1&pid=ImgDetMain',
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => const LoadingIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            article.source?.name ?? '',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text(
             article.title ?? '',
            style:
                Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14),
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Text(
              timeago.format(article.publishedAt!),
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
