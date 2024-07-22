part of 'newslist_bloc.dart';

@immutable
sealed class NewslistEvent {}

class NewsListFetchEvent extends NewslistEvent {
  final String tag;

  NewsListFetchEvent({required this.tag});
}
