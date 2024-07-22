import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_mini_project_new/features/news_list/bloc/newslist_bloc.dart';
import 'package:meta/meta.dart';

import '../data/weblink_data_model.dart';
import '../repos/repo_categories.dart';

part 'web_link_news_list_event.dart';
part 'web_link_news_list_state.dart';

class WebLinkNewsListBloc extends Bloc<WebLinkNewsListEvent, WebLinkListState> {
  WebLinkNewsListBloc() : super(CategoryscreenInitial()) {
    on<WebLinkNewsListFetchEvent>(webLinkNewsListFetchEvent);
  }

  Future<FutureOr<void>> webLinkNewsListFetchEvent(WebLinkNewsListFetchEvent event, Emitter<WebLinkListState> emit) async {
    WebLinkDataModel data=await RepoCategories.getCategoriesNow(tag: event.tag,);
    try {
      if(data.status=='error'){
        emit(WebLinkListErroeFetchState());
        print('WebLinkListErroeFetchState   Error ${data.status}');
      }else {
        emit(WebLinkListFetchState(categoryDataModel: data.sources!));
      }
    }catch(e){
      print('homeTrendingNewsFetchEvent Exception $e');
    }

  }
}
