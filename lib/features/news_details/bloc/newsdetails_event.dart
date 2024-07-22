part of 'newsdetails_bloc.dart';

@immutable
sealed class NewsdetailsEvent {}

class NewsDetailGetDetailsEvent extends NewsdetailsEvent {}

class NewsDetailsWebClickEvent extends NewsdetailsEvent {
  final String url;

  NewsDetailsWebClickEvent({required this.url});
}