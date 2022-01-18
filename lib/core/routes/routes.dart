import 'package:flutter/material.dart';
import 'package:values_generator/features/app_launcher/widgets/app_launcher.dart';
import 'package:values_generator/features/values_generator/widgets/main_screen.dart';

import '../../main.dart';

final Map<String, WidgetBuilder> appRoutes = {
 '/': (context) => const AppLauncher(),
 '/mainScreen': (context) => const MainScreen(),
};

// abstract class Routing {
//   GlobalKey<NavigatorState> get navigatorKey;
//   Map<String, WidgetBuilder> get appRoutes;
// }
//
// @Singleton(as: Routing)
// class RoutingImp implements Routing {
//   @override
//   final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
//
//   @override
//   Map<String, WidgetBuilder> get appRoutes => {
//     '/': (context) => const AppLauncher(),
//     '/mainScreen': (context) => const MainScreen(),
//   };
// }
