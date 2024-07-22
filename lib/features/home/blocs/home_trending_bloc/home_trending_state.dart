part of 'home_trending_bloc.dart';

@immutable
sealed class HomeTrendingState {}

abstract class HomeTrendingActionState extends HomeTrendingState{}

final class HomeTrendingInitial extends HomeTrendingState {}

class HomeTrendingNewsFetchState extends HomeTrendingState {
  final List<Articles> trendingArticles;

  HomeTrendingNewsFetchState({required this.trendingArticles});
}

class TrendingNewsErrorState extends HomeTrendingState {}

class TrendingNewsErrorActionState extends HomeActionState {
  final String status;

  TrendingNewsErrorActionState({required this.status});

}

class HomeTrendingNewsClickActionState extends HomeTrendingActionState {}
