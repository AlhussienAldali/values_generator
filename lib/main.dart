import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:easy_logger/easy_logger.dart';
import 'core/app/app.dart';
import 'core/di/di.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EasyLocalization.logger.enableLevels = [
    LevelMessages.error,
    LevelMessages.warning
  ];
  await EasyLocalization.ensureInitialized();

  configureInjection();
  runApp(EasyLocalization(
      path: 'assets/locales',
      supportedLocales: const [Locale('en')],
      child: App()));
}
