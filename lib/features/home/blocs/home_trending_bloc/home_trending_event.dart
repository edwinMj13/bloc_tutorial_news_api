part of 'home_trending_bloc.dart';

@immutable
sealed class HomeTrendingEvent {}

class HomeTrendingNewsFetchEvent extends HomeTrendingEvent {}

