part of 'newsdetails_bloc.dart';

@immutable
sealed class NewsdetailsState {}

abstract class NewsDetailsActionState extends NewsdetailsState {}

final class NewsdetailsInitial extends NewsdetailsState {}

class NewsDetailsFetchState extends NewsdetailsState {
  final Articles articles;

  NewsDetailsFetchState({required this.articles});
}

class NewsDetailsWebButtonState extends NewsDetailsActionState {}


