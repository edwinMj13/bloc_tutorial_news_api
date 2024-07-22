import 'package:bloc_mini_project_new/features/home/blocs/carousel/carousel_dot_bloc.dart';
import 'package:bloc_mini_project_new/features/home/blocs/home_trending_bloc/home_trending_bloc.dart';
import 'package:bloc_mini_project_new/features/home/datas/categories_list.dart';
import 'package:bloc_mini_project_new/features/home/datas/country_model.dart';
import 'package:bloc_mini_project_new/features/home/ui/widgets/breaking_news/breaking_carousel_shimmer.dart';
import 'package:bloc_mini_project_new/features/home/ui/widgets/breaking_news/breaking_news_widget.dart';
import 'package:bloc_mini_project_new/features/home/ui/widgets/category_List/categories_widget.dart';
import 'package:bloc_mini_project_new/features/home/ui/widgets/trending_news/trending_news_widget.dart';
import 'package:bloc_mini_project_new/features/home/ui/widgets/trending_news/trending_shimmer.dart';
import 'package:bloc_mini_project_new/features/write_to_developer/write_to_delevoler.dart';
import 'package:bloc_mini_project_new/utils/images_dummy.dart';
import 'package:bloc_mini_project_new/utils/measurements.dart';
import 'package:bloc_mini_project_new/utils/utils.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

import '../../news_list/ui/news_list.dart';
import '../../web_link_news_list_screen/ui/web_link_news_list_screen.dart';
import '../blocs/home_breaking_bloc/home_bloc.dart';
import '../datas/trBr_data_model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final carousalController = CarouselController();
  HomeBloc breakingBloc = HomeBloc();
  HomeTrendingBloc homeTrendingBloc = HomeTrendingBloc();
  CarouselDotBloc carouselDotBloc=CarouselDotBloc();

  @override
  void initState() {
    // TODO: implement initState
    breakingBloc.add(HomeBreakingNewsFetchEvent());
   homeTrendingBloc.add(HomeTrendingNewsFetchEvent());
   //  BlocProvider.of<HomeBloc>(context).add(HomeBreakingNewsFetchEvent());
   //  BlocProvider.of<HomeBloc>(context).add(HomeTrendingNewsFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
        actions: [
          PopupMenuButton(
              child: Icon(Icons.more_vert),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: Text("Contact"),
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WriteToUs()));
                    },
                  ),
                  //  PopupMenuItem(child: Text("data"))
                ];
              })
        ],
      ),
      body:
          // BlocConsumer<HomeBloc, HomeState>(
          //     home_breaking_bloc: homeBloc,
          //     buildWhen: (previous, current) => current is! HomeActionState,
          //     listenWhen: (previous, current) => current is HomeActionState,
          //     listener: (BuildContext context, HomeState state) {
          //       if (state is HomeTrendingNewsClickActionState) {
          //         Navigator.of(context)
          //             .push(MaterialPageRoute(builder: (ctx) => NewsListScreen()));
          //       }
          //     },
          //     builder: (context, state) {
          //       print('HomeConsumer ${state.runtimeType}');
          //       switch (state.runtimeType) {
          //         case HomeTrendingNewsFetchState :
          //           final breakingState = state as HomeBreakingNewsFetchState;
          //           final trendingState = state as HomeTrendingNewsFetchState;
          //           List<Articles> listTen = [];
          //           for (int i = 0; i < 10; i++) {
          //             listTen.add(breakingState.breakingDataModel[i]);
          //           }
          //           return
          Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              kHeight20,
              SizedBox(
                height: 80,
                width: double.infinity,
                child: CategoriesWidget(),
              ),
              LimitedBox(
                maxHeight: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => WebLinkListNewsList(
                                  title: languages[index].language,
                                  code: languages[index].code,
                                )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                width: 75,
                                height: 75,
                                decoration: BoxDecoration(
                                  color: colorList[index],
                                ),
                                child: Center(
                                    child: Text(
                                  languages[index].code,
                                  style: const TextStyle(
                                      fontSize: 30, color: Colors.white),
                                )),
                              ),
                            ),
                            Text(languages[index].language),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: languages.length,
                ),
              ),
              BlocBuilder<HomeBloc, HomeState>(
                bloc: breakingBloc,
                builder: (context, state) {
                  print("Breaking State ${state.runtimeType}");
                  switch (state.runtimeType) {
                    case HomeInitial:
                      return const BreakingCarouselShimmer();
                    case HomeBreakingNewsFetchState:
                      final breakingState = state as HomeBreakingNewsFetchState;
                      List<Articles> listTen = [];
                      for (int i = 0; i < 6; i++) {
                        listTen.add(breakingState.breakingDataModel[i]);
                      }
                      return BreakingNewsWidget(
                        homeBloc: breakingBloc,
                        brArticles: listTen,
                        carouselDotBloc:carouselDotBloc,
                      );
                    default:
                      return BreakingCarouselShimmer();
                  }
                  // if(state is HomeBreakingNewsFetchState) {
                  //   final breakingState = state as HomeBreakingNewsFetchState;
                  //   List<Articles> listTen = [];
                  //   for (int i = 0; i < 10; i++) {
                  //     listTen.add(breakingState.breakingDataModel[i]);
                  //   }
                  //   return BreakingNewsWidget(
                  //     homeBloc: breakingBloc,
                  //     brArticles: listTen,
                  //   );
                  // }else if(state is HomeInitial){
                  //   return const BreakingCarouselShimmer();
                  // }else{
                  //   return SizedBox();
                  // }
                },
              ),
              DotContainerCarousel(carouselDotBloc:carouselDotBloc,),
              kHeight10,
              BlocBuilder<HomeTrendingBloc, HomeTrendingState>(
                bloc: homeTrendingBloc,
                builder: (context, state) {
                  print("Trending State ${state.runtimeType}");
                  switch (state.runtimeType) {
                    case HomeTrendingInitial:
                      return TrendingShimmer();
                    case HomeTrendingNewsFetchState:
                      final trendingState = state as HomeTrendingNewsFetchState;
                      return TrendingNewsWidget(
                        homeBloc: homeTrendingBloc,
                        trendingList: trendingState.trendingArticles,
                      );
                    default:
                      return TrendingShimmer();
                  }
                  // if(state is HomeTrendingNewsFetchState) {
                  //   final trendingState = state as HomeTrendingNewsFetchState;
                  //   return TrendingNewsWidget(
                  //     homeBloc: homeTrendingBloc,
                  //     trendingList: trendingState.trendingArticles,
                  //   );
                  // }else{
                  //   return SizedBox();
                  // }
                },
              ),
            ],
          ),
        ),
      ),
      //       default :
      //         return SizedBox();
      //     }
      //   },
      // ),
    );
  }
}
