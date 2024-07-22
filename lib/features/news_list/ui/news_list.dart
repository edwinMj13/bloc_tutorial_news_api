import 'package:bloc_mini_project_new/features/home/datas/trBr_data_model.dart';
import 'package:bloc_mini_project_new/features/news_details/ui/news_details_screen.dart';
import 'package:bloc_mini_project_new/features/news_list/bloc/newslist_bloc.dart';
import 'package:bloc_mini_project_new/features/news_list/ui/news_list_shimmer.dart';
import 'package:bloc_mini_project_new/utils/images_dummy.dart';
import 'package:bloc_mini_project_new/utils/measurements.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/utils.dart';

class NewsListScreen extends StatefulWidget {
  final String tag;

  const NewsListScreen({
    super.key,
    required this.tag,
  });

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  final NewslistBloc newslistBloc = NewslistBloc();

  @override
  void initState() {
    // TODO: implement initState
    newslistBloc.add(NewsListFetchEvent(tag: widget.tag));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.tag} News"),
      ),
      body: BlocBuilder<NewslistBloc, NewslistState>(
        bloc: newslistBloc,
        builder: (context, state) {
          print("NewsList State  ${state.runtimeType}");
          if (state is NewsListFetchState) {
            final newsListState = state;
            return ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    final articles=Articles(
                      author: newsListState.articles[index].author,
                      content:newsListState.articles[index].content ?? "",
                      description:newsListState.articles[index].description ?? "",
                      publishedAt:newsListState.articles[index].publishedAt ?? "",
                      source: newsListState.articles[index].source! ,
                      title:newsListState.articles[index].title ?? "",
                      url:newsListState.articles[index].url  ?? "",
                      urlToImage:newsListState.articles[index].urlToImage!=null
                      ? imageNonNull(newsListState.articles[index].urlToImage!)
                          : noImageAvilable,
                    );
                    print("Article Image ${articles.urlToImage}");
                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewsDetailsScreen(articles: articles,)));
                  },
                  child: Column(
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          minHeight: 200.0,
                        ),
                        child: Image.network(
                          newsListState.articles[index].urlToImage==null
                              ?noImageAvilable
                              :imageNonNull(newsListState.articles[index].urlToImage!),),
                      ),
                      kHeight10,
                      Text(
                        newsListState.articles[index].title!,
                        style: TextStyle(fontSize: 18),
                      ),
                      kHeight10,
                      Text(newsListState.articles[index].content!),
                    ],
                  ),
                );
              },
              itemCount: 20,
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

}
