part of 'web_link_news_list_bloc.dart';

@immutable
sealed class WebLinkListState {}

abstract class CategoryActionState extends WebLinkListState{}

final class CategoryscreenInitial extends WebLinkListState {}

class WebLinkListFetchState extends WebLinkListState {
  final List<Sources> categoryDataModel;

  WebLinkListFetchState({required this.categoryDataModel});

}

class WebLinkListErroeFetchState extends WebLinkListState {}

class WebLinkListActionState extends WebLinkListState {}

