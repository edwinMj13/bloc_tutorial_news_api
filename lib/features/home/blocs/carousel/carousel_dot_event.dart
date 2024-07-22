part of 'carousel_dot_bloc.dart';

@immutable
sealed class CarouselDotEvent {}
class HomeCarouselDotEvent extends CarouselDotEvent {
  final int value;

  HomeCarouselDotEvent({required this.value});
}
