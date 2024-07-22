import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_mini_project_new/features/home/datas/trBr_data_model.dart';
import 'package:bloc_mini_project_new/features/news_list/repos/news_list_repos.dart';
import 'package:meta/meta.dart';

part 'newslist_event.dart';
part 'newslist_state.dart';

class NewslistBloc extends Bloc<NewslistEvent, NewslistState> {
  NewslistBloc() : super(NewslistInitial()) {
    on<NewsListFetchEvent>(newsListFetchEvent);
  }

  FutureOr<void> newsListFetchEvent(NewsListFetchEvent event, Emitter<NewslistState> emit) async{
    TrBrDataModel data=await NewsListRepos.getNewsList(event.tag);
    try {
      if(data.status=='error'){
        emit(NewsListFetchErrorState());
        print('NewsListFetchErrorState   Error ${data.status}');
      }else {
        emit(NewsListFetchState(articles: data.articles!));
      }
    }catch(e){
      print('homeTrendingNewsFetchEvent Exception $e');
    }

  }
}
