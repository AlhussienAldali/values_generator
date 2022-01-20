part of 'values_bloc.dart';

@immutable
abstract class ValuesState extends Equatable {
  @override
  List<Object> get props => [];
}

class ValuesInitial extends ValuesState {}

class RepeatedState extends ValuesState {


  final String selectedValue;
  final bool isFavorite;
  RepeatedState({required this.selectedValue,required this.isFavorite});
  @override
  List<Object> get props => [selectedValue,isFavorite];
}
