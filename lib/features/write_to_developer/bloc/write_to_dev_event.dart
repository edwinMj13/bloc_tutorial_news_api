part of 'write_to_dev_bloc.dart';

@immutable
sealed class WriteToDevEvent {}

class WritePostDataEvent extends WriteToDevEvent {
  final String name;
  final String email;
  final String subject;
  final String details;

  WritePostDataEvent({required this.name, required this.email, required this.subject, required this.details});
}
