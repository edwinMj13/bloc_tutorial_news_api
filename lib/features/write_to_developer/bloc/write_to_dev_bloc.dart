import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_mini_project_new/features/write_to_developer/models/write_to_us_data_model.dart';
import 'package:bloc_mini_project_new/features/write_to_developer/repos/repo_post.dart';
import 'package:meta/meta.dart';

part 'write_to_dev_event.dart';
part 'write_to_dev_state.dart';

class WriteToDevBloc extends Bloc<WriteToDevEvent,WriteToDevState> {
  WriteToDevBloc() : super(WriteToDevInitial()) {
    on<WritePostDataEvent>(writePostDataEvent);
  }

  Future<FutureOr<void>> writePostDataEvent(WritePostDataEvent event, Emitter<WriteToDevState> emit) async {
    dynamic data=await RepoPost.postDetails(name: event.name, email: event.email, subject: event.subject, details: event.details);

    print("${data.runtimeType}");

    switch (data.runtimeType) {
      case WriteToUsDataModel:
        emit(WriteSnackBarState());
      default :
        print('Error Happend');
    }
  }
}


