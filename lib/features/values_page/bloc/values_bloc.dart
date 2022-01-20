import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:values_generator/core/di/di.dart';
import 'package:values_generator/features/favorites/repository/favorites_repo.dart';
import 'package:values_generator/features/values_page/repository/values_repo.dart';

part 'values_event.dart';

part 'values_state.dart';

@Injectable()
class ValuesBloc extends Bloc<ValuesEvent, ValuesState> {
  ValuesRepo valuesRepo = getIt.get<ValuesRepo>();
  FavoritesRepo favoritesRepo = getIt.get<FavoritesRepo>();
  late int currentIndex;
  late List<int> favorites;
  late Map<String, dynamic> values;
  Duration duration = const Duration(seconds: 5);
  Random valuesRandomIndex = Random();

  ValuesBloc() : super(ValuesInitial()) {
    on<ValuesEvent>((event, emit) {
      if (event is UpdateFavorites) {
        if(_checkIfFavorite()==false) {
          favoritesRepo.saveToLocalStorage(event.index);
        } else {
          favoritesRepo.removeFromLocalStorage(event.index);
        }

        emit(RepeatedState(
            selectedValue: values[currentIndex.toString()]!,
            isFavorite: _checkIfFavorite()));
      }
    });
    _refresh();
  }

  _refresh() async {

    values = valuesRepo.getFromLocalStorage();
    currentIndex = (valuesRandomIndex.nextInt(values.length) + 1);
    emit(RepeatedState(
        selectedValue: values[currentIndex.toString()]!,
        isFavorite: _checkIfFavorite()));
    Timer.periodic(duration, (timer) {
      currentIndex = (valuesRandomIndex.nextInt(values.length) + 1);
      // print(values[index]);
      emit(RepeatedState(
          selectedValue: values[currentIndex.toString()]!,
          isFavorite: _checkIfFavorite()));
    });
  }

  _checkIfFavorite() {
    favorites = favoritesRepo.getFromLocalStorage();
    // print("favorites : "+favorites.toString());
    if (favorites.contains(currentIndex)==true) {
      return true;
    } else {
      return false;
    }
  }
}
