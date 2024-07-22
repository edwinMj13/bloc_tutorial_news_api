import 'dart:ui';

import 'package:bloc_mini_project_new/features/home/datas/trBr_data_model.dart';
import 'package:bloc_mini_project_new/features/news_details/bloc/newsdetails_bloc.dart';
import 'package:bloc_mini_project_new/utils/images_dummy.dart';
import 'package:bloc_mini_project_new/utils/measurements.dart';
import 'package:bloc_mini_project_new/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
  final NewsdetailsBloc newsdetailsBloc = NewsdetailsBloc();
  final Articles articles;

  NewsDetailsScreen({
    super.key,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    print(articles.urlToImage);
    return Scaffold(
      body: BlocListener<NewsdetailsBloc, NewsdetailsState>(
          bloc: newsdetailsBloc,
          listener: (BuildContext context, NewsdetailsState state) async {
            print('NewsdetailsState ${state.runtimeType}');
            if (state is NewsDetailsWebButtonState) {
              await launchUrl(Uri.parse(articles.url!),
                  mode: LaunchMode.inAppBrowserView);
            }
          },
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                toolbarHeight: 150,
                title: AppBarIcons(
                    newsdetailsBloc: newsdetailsBloc, articles: articles),
                bottom: appBarTitle(),
                pinned: true,
                expandedHeight: 300,
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    articles.urlToImage!,
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Author : ${articles.author==null ? 'Not Available' :articles.author}"),
                      Text("Published At : ${articles.publishedAt}"),
                      kHeight20,
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.blueGrey,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              Text('Description',style: fontSize17ColorWhite,),
                              Text(articles.description!,style: fontSize15ColorWhite,),
                            ],
                          ),
                        ),
                      ),
                      kHeight20,
                      Text(
                        '${articles.content!} \n'
                            '${articles.content!} \n'
                            '${articles.content!} \n'
                            '${articles.content!}',
                        style: const TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  getAuthor(String auth) {
    String? author = auth == null ? 'Not Available' : articles.author;
    return author;
  }

  PreferredSize appBarTitle() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(0),
      child: Container(
        padding: const EdgeInsets.only(top: 5, bottom: 10),
        color: Colors.black54,
        width: double.maxFinite,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Text(
              articles.title!,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500,color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class AppBarIcons extends StatelessWidget {
  const AppBarIcons({
    super.key,
    required this.newsdetailsBloc,
    required this.articles,
  });

  final NewsdetailsBloc newsdetailsBloc;
  final Articles articles;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.teal,
                  size: 25,
                ))),
        Container(
            decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
                onPressed: () {
                  newsdetailsBloc
                      .add(NewsDetailsWebClickEvent(url: articles.url!));
                },
                icon: const Icon(
                  Icons.public_outlined,
                  color: Colors.teal,
                  size: 25,
                ))),
      ],
    );
  }
}
