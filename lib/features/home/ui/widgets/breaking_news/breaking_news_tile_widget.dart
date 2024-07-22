import 'package:bloc_mini_project_new/features/home/datas/trBr_data_model.dart';
import 'package:bloc_mini_project_new/features/news_details/data/data.dart';
import 'package:bloc_mini_project_new/features/news_details/ui/news_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../utils/utils.dart';
import '../../../../news_list/ui/news_list.dart';
import '../../../blocs/home_breaking_bloc/home_bloc.dart';

class BreakingNewsTileWidget extends StatelessWidget {
  final List<Articles> articleList;
  final int index;
  final HomeBloc homeBloc;

  const BreakingNewsTileWidget({
    super.key,
    required this.articleList,
    required this.index,
    required this.homeBloc,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final articles = Articles(
          author: articleList[index].author,
          content: articleList[index].content ?? "",
          description: articleList[index].description ?? "",
          publishedAt: articleList[index].publishedAt ?? "",
          source: articleList[index].source!,
          title: articleList[index].title ?? "",
          url: articleList[index].url ?? "",
          urlToImage: articleList[index].urlToImage != null
              ? imageNonNull(articleList[index].urlToImage!)
              : noImageAvilable,
        );
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => NewsDetailsScreen(articles: articles)));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.network(
                articleList[index].urlToImage!,
                fit: BoxFit.cover,
                height: 255,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black38,
                  ),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      articleList[index].title!,
                      style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.w500),
                    ),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
