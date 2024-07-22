import 'package:bloc_mini_project_new/features/news_details/data/data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/images_dummy.dart';
import '../../../../../utils/measurements.dart';
import '../../../../news_details/ui/news_details_screen.dart';
import '../../../../news_list/ui/news_list.dart';
import '../../../blocs/carousel/carousel_dot_bloc.dart';
import '../../../blocs/home_breaking_bloc/home_bloc.dart';
import '../../../datas/trBr_data_model.dart';
import '../widget_title.dart';
import 'breaking_news_tile_widget.dart';

class BreakingNewsWidget extends StatelessWidget {
  final HomeBloc homeBloc;
  List<Articles> brArticles;
  final CarouselDotBloc carouselDotBloc;

  BreakingNewsWidget(
      {super.key, required this.homeBloc, required this.brArticles, required this.carouselDotBloc});

  @override
  Widget build(BuildContext context) {
    return
      // BlocConsumer<HomeBloc, HomeState>(
      // home_breaking_bloc: homeBloc,
      // buildWhen: (previous,current) => current is !HomeActionState,
      // listenWhen: (previous,current)=> current is HomeActionState,
      // listener: (BuildContext context, HomeState state) {
      //   if(state is HomeTrendingNewsClickActionState){
      //     Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>NewsListScreen()));
      //   }
      // },
      // builder: (context, state) {
      //   print("Breaking State ${state.runtimeType}");
      //   switch(state.runtimeType){
      //     case HomeBreakingNewsFetchState:
      //       List<Articles> listTen=[];
      //       final successState=state as HomeBreakingNewsFetchState;
      //       for(int i=0; i < 10;i++){
      //         listTen.add(successState.breakingDataModel[i]);
      //       }
      //       //getnewsDetails(author, content, description, publishedAt, source, title, url, urlToImage);
      //       return
      Column(
        children: [
          WidgetTitle(title: 'Breaking Now !', tag: 'Breaking'),
          kHeight10,
          Column(
            children: [
              CarouselSlider(
                items: brArticles.map((e) {
                  return BreakingNewsTileWidget(
                    articleList: brArticles,
                    index: brArticles.indexOf(e),
                    homeBloc: homeBloc,
                  );
                }).toList(),
                options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 2,
                    onPageChanged: (val, reason) {
                      print("$val     $reason");
                      carouselDotBloc.add(HomeCarouselDotEvent(value: val));
                    }
                ),
              ),
            ],
          ),
        ],
      );
    //       default:
    //         return SizedBox();
    //     }
    //
    //   },
    // );
  }
}


class DotContainerCarousel extends StatelessWidget {
  final CarouselDotBloc carouselDotBloc;

  const DotContainerCarousel({
    super.key, required this.carouselDotBloc,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarouselDotBloc, CarouselDotState>(
      bloc: carouselDotBloc,
      builder: (context, state) {
        switch(state.runtimeType){
          case HomeCarouselDotState:
            final dataState=state as HomeCarouselDotState;
            return Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  Spacer(),
                  Container(
                    width: 100,
                    height: 10,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 10,
                          height: 10,
                          padding: const EdgeInsets.only(top: 7.0),
                          margin: const EdgeInsets.only(left: 5.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: dataState.value==index
                              ?Colors.blue
                                  : Colors.grey
                          ),
                        );
                      },
                      itemCount: 6,
                    ),
                  ),
                  Spacer(),
                ],),
            );
          default:
            return SizedBox();
        }

      },
    );
  }
}
