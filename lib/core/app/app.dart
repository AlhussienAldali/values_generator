import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:values_generator/core/routes/routes.dart';
import 'package:values_generator/core/ui_constrains/themes/app_theme.dart';
import 'package:values_generator/features/app_launcher/widgets/app_launcher.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme(),
      darkTheme: darkTheme(),
      routes: appRoutes,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
