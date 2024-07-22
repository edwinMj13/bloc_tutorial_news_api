part of 'web_link_news_list_bloc.dart';

@immutable
sealed class WebLinkNewsListEvent {}

 class WebLinkNewsListFetchEvent extends WebLinkNewsListEvent {
  final String tag;

  WebLinkNewsListFetchEvent({required this.tag});
}
