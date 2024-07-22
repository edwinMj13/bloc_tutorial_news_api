part of 'write_to_dev_bloc.dart';

@immutable
sealed class WriteToDevState {}

abstract class WriteActionState extends WriteToDevState {}

final class WriteToDevInitial extends WriteToDevState {}

class WritePostDataState extends WriteToDevState {

}

class WriteSnackBarState extends WriteActionState {}
