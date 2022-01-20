part of 'favorites_bloc.dart';

@immutable
abstract class FavoritesState extends Equatable {
  @override
  List<Object> get props => [];
}

class FavoritesInitial extends FavoritesState {}

class SuccessFulData extends FavoritesState {
  final List<String> favorites;

  SuccessFulData({required this.favorites});
}
