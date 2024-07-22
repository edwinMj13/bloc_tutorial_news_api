part of 'carousel_dot_bloc.dart';

@immutable
sealed class CarouselDotState {}

final class CarouselDotInitial extends CarouselDotState {}

class HomeCarouselDotState extends CarouselDotState {
  final int value;

  HomeCarouselDotState({required this.value});

}