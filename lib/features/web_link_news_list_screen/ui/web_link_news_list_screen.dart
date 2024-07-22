import 'package:any_link_preview/any_link_preview.dart';
import 'package:bloc_mini_project_new/features/web_link_news_list_screen/bloc/web_link_news_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class WebLinkListNewsList extends StatefulWidget {
  final String title;

  final String code;

  // HomeBloc home_breaking_bloc;

  WebLinkListNewsList({
    super.key,
    required this.title,
    this.code = '',
  });

  @override
  State<WebLinkListNewsList> createState() => _WebLinkListNewsList();
}

class _WebLinkListNewsList extends State<WebLinkListNewsList> {
//  HomeBloc home_breaking_bloc;
  WebLinkNewsListBloc categoryscreenBloc = WebLinkNewsListBloc();

  //_CategoriesNewsListState(this.home_breaking_bloc);

  @override
  void initState() {
    // TODO: implement initState
    categoryscreenBloc.add(WebLinkNewsListFetchEvent(
        tag: widget.code != '' ? widget.code : widget.title.toLowerCase()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocConsumer<WebLinkNewsListBloc, WebLinkListState>(
        bloc: categoryscreenBloc,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case WebLinkListFetchState:
              final sucessState = state as WebLinkListFetchState;
              return ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      launchUrl(
                          Uri.parse(sucessState.categoryDataModel[index].url!),
                          mode: LaunchMode.inAppBrowserView);
                    },
                    child: Column(
                      children: [
                        Container(
                          child: AnyLinkPreview(
                            link: sucessState.categoryDataModel[index].url!,
                          ),
                        )
                      ],
                    ),
                  );
                },
                itemCount: sucessState.categoryDataModel.length,
              );
            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
