part of 'newslist_bloc.dart';

@immutable
sealed class NewslistState {}

abstract class NewsListActionState extends NewslistState {}

final class NewslistInitial extends NewslistState {}

class NewsListFetchState extends NewslistState {
  final List<Articles> articles;

  NewsListFetchState({required this.articles});

}

class NewsListFetchErrorState extends NewslistState {}
