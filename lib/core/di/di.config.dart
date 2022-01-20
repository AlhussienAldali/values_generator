// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/add_value/bloc/add_value_bloc.dart' as _i3;
import '../../features/add_value/repository/add_value_repo.dart' as _i4;
import '../../features/app_launcher/bloc/app_launcher_bloc.dart' as _i5;
import '../../features/favorites/bloc/favorites_bloc.dart' as _i6;
import '../../features/favorites/repository/favorites_repo.dart' as _i7;
import '../../features/values_page/bloc/values_bloc.dart' as _i8;
import '../../features/values_page/repository/values_repo.dart' as _i9;
import '../services/shared_preferences.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AddValueBloc>(() => _i3.AddValueBloc());
  gh.factory<_i4.AddValueRepo>(() => _i4.AddValueRepo());
  gh.factory<_i5.AppLauncherBloc>(() => _i5.AppLauncherBloc());
  gh.factory<_i6.FavoritesBloc>(() => _i6.FavoritesBloc());
  gh.factory<_i7.FavoritesRepo>(() => _i7.FavoritesRepo());
  gh.factory<_i8.ValuesBloc>(() => _i8.ValuesBloc());
  gh.factory<_i9.ValuesRepo>(() => _i9.ValuesRepo());
  gh.singleton<_i10.SharedPrefService>(_i10.SharedPrefServiceImp());
  return get;
}
