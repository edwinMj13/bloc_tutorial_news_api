import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_mini_project_new/features/home/datas/trBr_data_model.dart';
import 'package:meta/meta.dart';

import '../../repos/repo_home.dart';
import '../home_breaking_bloc/home_bloc.dart';

part 'home_trending_event.dart';
part 'home_trending_state.dart';

class HomeTrendingBloc extends Bloc<HomeTrendingEvent, HomeTrendingState> {
  HomeTrendingBloc() : super(HomeTrendingInitial()) {
   on<HomeTrendingNewsFetchEvent>(homeTrendingNewsFetchEvent);
  }
  FutureOr<void> homeTrendingNewsFetchEvent(HomeTrendingNewsFetchEvent event, Emitter<HomeTrendingState> emit) async{
    TrBrDataModel data = await RepoHome.getTrendingNow(tag: 'trending');
    try {
      if(data.status=='error'){
        emit(TrendingNewsErrorState());
        print('TrendingNewsErrorState   Error ${data.status}');
      }else {
        emit(HomeTrendingNewsFetchState(trendingArticles: data.articles!));
      }
    }catch(e){
      print('homeTrendingNewsFetchEvent Exception $e');
    }
  }
}
