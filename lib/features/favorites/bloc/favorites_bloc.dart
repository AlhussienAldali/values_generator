import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:values_generator/core/di/di.dart';
import 'package:values_generator/features/favorites/repository/favorites_repo.dart';
import 'package:values_generator/features/values_page/repository/values_repo.dart';

part 'favorites_event.dart';

part 'favorites_state.dart';

@injectable
class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesRepo favoritesRepo = getIt.get<FavoritesRepo>();
  ValuesRepo valuesRepo = getIt.get<ValuesRepo>();

  late List<int> favoritesIndexes;
  late Map<String, dynamic> values;
  List<String> favorites = [];

  FavoritesBloc() : super(FavoritesInitial()) {
    _fetchData();
  }

  void _fetchData() {
    favoritesIndexes = favoritesRepo.getFromLocalStorage();
    values = valuesRepo.getFromLocalStorage();

    for (int i = 0; i < favoritesIndexes.length; i++) {
      favorites.add(values[favoritesIndexes[i].toString()]);
    }
    emit(SuccessFulData(favorites: favorites));
  }
}
