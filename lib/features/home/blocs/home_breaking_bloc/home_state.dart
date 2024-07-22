part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState {}

final class HomeInitial extends HomeState {}

class HomeBreakingNewsFetchState extends HomeState {
   final List<Articles> breakingDataModel;

  HomeBreakingNewsFetchState({required this.breakingDataModel});
}

class HomeBreakingFetchErrorState extends HomeState{}


class HomeBreakingNewsClickActionState extends HomeActionState {}


