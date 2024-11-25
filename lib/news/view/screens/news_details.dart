import 'package:flutter/material.dart';
import 'package:news/news/data/models/article.dart';
import 'package:news/news/view/widgets/news_item.dart';
import 'package:news/shared/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  static const routeName = '/details';
  const NewsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Article article = ModalRoute.of(context)!.settings.arguments as Article;
    final Uri url = Uri.parse(article.url!);

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
            article.title!,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        body: Column(
          children: [
            NewsItem(article: article),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.3,
                width: MediaQuery.sizeOf(context).width * 0.9,
                decoration: BoxDecoration(
                    color: AppTheme.whiteColor,
                    border: Border.all(
                      color: AppTheme.whiteColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(25)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        article.content!,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () async {
                          if (!await launchUrl(url)) {
                            throw Exception('Could not launch $url');
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'View Full Artical',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            const Icon(Icons.arrow_right)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
