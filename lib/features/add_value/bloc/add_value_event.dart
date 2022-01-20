part of 'add_value_bloc.dart';

@immutable
abstract class AddValueEvent {}

class SaveValue extends AddValueEvent {
  final String valueText;

  SaveValue({required this.valueText});
}

class ReAddValue extends AddValueEvent {}
