part of 'values_bloc.dart';

@immutable
abstract class ValuesEvent {}

class UpdateFavorites extends ValuesEvent {
  final int index;

  UpdateFavorites({required this.index});
}
