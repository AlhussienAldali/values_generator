import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:values_generator/core/services/shared_preferences.dart';
import 'core/app/app.dart';
import 'core/di/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EasyLocalization.logger.enableLevels = [
    LevelMessages.error,
    LevelMessages.warning
  ];
  await EasyLocalization.ensureInitialized();
  final _prefs = await SharedPreferences.getInstance();
   // _prefs.remove("local values");
  configureInjection();
  getIt.get<SharedPrefService>().initiateSharedPref( _prefs);
  runApp(EasyLocalization(
      path: 'assets/locales',
      supportedLocales: const [Locale('en')],
      child: App()));
}
