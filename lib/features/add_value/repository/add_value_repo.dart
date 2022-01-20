import 'package:injectable/injectable.dart';
import 'package:values_generator/core/di/di.dart';
import 'package:values_generator/core/repository/base_repo.dart';
import 'package:values_generator/core/services/shared_preferences.dart';


@injectable
class AddValueRepo implements BaseRepository{
  @override
  getApiRequest() {
    // TODO: implement getApiRequest
    throw UnimplementedError();
  }

  @override
  getFromLocalStorage() {

  }

  @override
  saveToLocalStorage(value) {
    getIt.get<SharedPrefService>().saveValue(value);
  }

  @override
  removeFromLocalStorage(value) {
    // TODO: implement removeFromLocalStorage
    throw UnimplementedError();
  }

}