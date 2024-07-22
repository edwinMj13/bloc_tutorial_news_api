import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_mini_project_new/features/home/datas/trBr_data_model.dart';
import 'package:bloc_mini_project_new/features/news_details/data/data.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';

part 'newsdetails_event.dart';
part 'newsdetails_state.dart';

class NewsdetailsBloc extends Bloc<NewsdetailsEvent, NewsdetailsState> {
  NewsdetailsBloc() : super(NewsdetailsInitial()) {
    on<NewsDetailGetDetailsEvent>(newsDetailGetDetailsEvent);
    on<NewsDetailsWebClickEvent>(newsDetailsWebClickEvent);
  }

  FutureOr<void> newsDetailGetDetailsEvent(NewsDetailGetDetailsEvent event, Emitter<NewsdetailsState> emit) {
   // emit(NewsDetailsFetchState(articles: event.)));
  }

  FutureOr<void> newsDetailsWebClickEvent(NewsDetailsWebClickEvent event, Emitter<NewsdetailsState> emit) {
    emit(NewsDetailsWebButtonState());
  }
}
