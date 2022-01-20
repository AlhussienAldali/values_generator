import 'package:flutter/material.dart';
import 'package:values_generator/features/app_launcher/widgets/app_launcher.dart';
import 'package:values_generator/features/main_screen/widgets/main_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const AppLauncher(),
  '/mainScreen': (context) => const MainScreen(),
};
