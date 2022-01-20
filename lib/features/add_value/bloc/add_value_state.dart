part of 'add_value_bloc.dart';

@immutable
abstract class AddValueState extends Equatable {
  @override
  List<Object> get props => [];
}

class AddValueInitial extends AddValueState {}

class LoadingState extends AddValueState {}

class NewValueAddedSuccessfully extends AddValueState {}
