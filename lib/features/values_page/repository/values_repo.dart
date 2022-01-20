import 'package:injectable/injectable.dart';
import 'package:values_generator/core/di/di.dart';
import 'package:values_generator/core/repository/base_repo.dart';
import 'package:values_generator/core/services/shared_preferences.dart';

@injectable
class ValuesRepo implements BaseRepository {
  @override
  getApiRequest() {
    // TODO: implement getApiRequest
    throw UnimplementedError();
  }

  @override
  getFromLocalStorage() {
    return getIt.get<SharedPrefService>().getValues();
  }

  @override
  saveToLocalStorage(value) {
    // TODO: implement saveToLocalStorage
    throw UnimplementedError();
  }

  @override
  removeFromLocalStorage(value) {
    // TODO: implement removeFromLocalStorage
    throw UnimplementedError();
  }


}
