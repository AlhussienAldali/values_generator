import 'package:injectable/injectable.dart';
import 'package:values_generator/core/di/di.dart';
import 'package:values_generator/core/repository/base_repo.dart';
import 'package:values_generator/core/services/shared_preferences.dart';

@injectable
class FavoritesRepo implements BaseRepository {
  @override
  getApiRequest() {
    // TODO: implement getApiRequest
    throw UnimplementedError();
  }

  @override
  getFromLocalStorage() {
    return getIt.get<SharedPrefService>().getFavorites();
  }

  @override
  saveToLocalStorage(value) {
    getIt.get<SharedPrefService>().saveToFavorites(value);
  }

  @override
  removeFromLocalStorage(value) {
    getIt.get<SharedPrefService>().removeFromFavorites(value);
  }
}
