import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../home_breaking_bloc/home_bloc.dart';

part 'carousel_dot_event.dart';
part 'carousel_dot_state.dart';

class CarouselDotBloc extends Bloc<CarouselDotEvent, CarouselDotState> {
  CarouselDotBloc() : super(CarouselDotInitial()) {
    on<HomeCarouselDotEvent>(homeCarouselDotEvent);
  }
}
FutureOr<void> homeCarouselDotEvent(HomeCarouselDotEvent event, Emitter<CarouselDotState> emit) {
  emit(HomeCarouselDotState(value: event.value));
}