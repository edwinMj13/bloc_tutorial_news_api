import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_mini_project_new/features/home/datas/trBr_data_model.dart';
import 'package:bloc_mini_project_new/features/home/repos/repo_home.dart';
import 'package:bloc_mini_project_new/utils/error_class.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeBreakingNewsFetchEvent>(breakingNewsFetchEvent);
  }

  Future<FutureOr<void>> breakingNewsFetchEvent(
      HomeBreakingNewsFetchEvent event, Emitter<HomeState> emit) async {
    dynamic data = await RepoHome.getBreakingNow(brTag: "breaking");
    print('data.runType ${data.runtimeType}');
    // try {
    switch (data.runtimeType) {
      case ErrorClass:
        final errorData= data as ErrorClass;
        emit(HomeBreakingFetchErrorState());
        print('HomeBreakingFetchErrorState   Error ${errorData.status}\n'
            'Message "${errorData.message}"');
      case TrBrDataModel:
        final trBrData= data as TrBrDataModel;
        emit(HomeBreakingNewsFetchState(breakingDataModel: trBrData.articles!));
    }
  }
// }catch(e){
//   print('breakingNewsFetchEvent Exception $e');
// }
// print(data.articles?[4].author);

}
