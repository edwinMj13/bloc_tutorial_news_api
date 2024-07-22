import 'package:bloc_mini_project_new/features/home/blocs/home_trending_bloc/home_trending_bloc.dart';
import 'package:bloc_mini_project_new/utils/images_dummy.dart';
import 'package:bloc_mini_project_new/utils/measurements.dart';
import 'package:bloc_mini_project_new/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../news_details/ui/news_details_screen.dart';
import '../../../../news_list/ui/news_list.dart';
import '../../../datas/trBr_data_model.dart';
import '../widget_title.dart';

class TrendingNewsWidget extends StatelessWidget {
  final HomeTrendingBloc homeBloc;
  final List<Articles> trendingList;
   TrendingNewsWidget({
    super.key, required  this.homeBloc, required this.trendingList,
  });

  @override
  Widget build(BuildContext context) {
    return
      // BlocBuilder<HomeBloc,HomeState>(
      // home_breaking_bloc: homeBloc,
      // builder:(context,state) {
      //   switch(state.runtimeType){
      //     case HomeTrendingNewsFetchState:
      //       final successState=state as HomeTrendingNewsFetchState;
      //       return
              Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                WidgetTitle(title: 'Trending News !',tag:'Trending'),
                kHeight10,
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder:(context,index){
                    // String checkk=successState.trendingArticles[index].urlToImage!;
                    // print("Check $checkk");
                    return GestureDetector(
                      onTap: (){
                        final articles=Articles(
                          author: trendingList[index].author,
                          content:trendingList[index].content ?? "",
                          description:trendingList[index].description ?? "",
                          publishedAt:trendingList[index].publishedAt ?? "",
                          source: trendingList[index].source! ,
                          title:trendingList[index].title ?? "",
                          url:trendingList[index].url  ?? "",
                          urlToImage:trendingList[index].urlToImage!=null
                              ?imageNonNull(trendingList[index].urlToImage!)
                          : noImageAvilable,
                        );
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewsDetailsScreen(articles: articles,)));

                      },
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                                trendingList[index].urlToImage!=null
                               ?imageNonNull(trendingList[index].urlToImage!)
                                    :noImageAvilable,
                              fit: BoxFit.cover,
                              height: 90,
                              width: 130,
                            ),
                          ),
                           Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 5.0),
                                child: Text(trendingList[index].title!),
                              )),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context,index)=>Divider(),
                  itemCount: 20,
                )
              ],
            );
    //       default:
    //         return SizedBox();
    //     }
    //   },
    // );
  }


}
