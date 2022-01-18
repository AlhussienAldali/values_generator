import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:values_generator/core/app/app.dart';
import 'package:values_generator/core/di/di.dart';
import 'package:values_generator/core/routes/routes.dart';
import 'package:values_generator/features/app_launcher/bloc/app_launcher_bloc.dart';
import 'package:values_generator/features/app_launcher/widgets/app_launcher.dart';
import 'package:values_generator/features/values_generator/widgets/main_screen.dart';
import 'package:mockito/mockito.dart';
import 'package:easy_logger/easy_logger.dart';

// class EasyLocalizaitionMock extends MockWithExpandedToString implements EasyLocalization {}

void main() {
  late AppLauncherBloc appLauncherBloc;

  setUp(() {
    appLauncherBloc = AppLauncherBloc();
  });

  tearDown(() {
    appLauncherBloc.close();
  });
  test("should start with AppLauncherInitial", () {
    expect(appLauncherBloc.state, AppLauncherInitial());
  });

  blocTest(
    "should emit AppLauncherFinished after 3 seconds",
    build: () => appLauncherBloc,
    act: (AppLauncherBloc bloc) async {
      await Future.delayed(const Duration(seconds: 3));
    },
    expect: () => [AppLauncherFinished()],
  );

  testWidgets("should navigate to mainScreen", (WidgetTester tester) async {
    await tester.runAsync(() async {
      EasyLocalization.logger.enableLevels = [
        LevelMessages.error,
        LevelMessages.warning
      ];
      await EasyLocalization.ensureInitialized();
      configureInjection();
      await tester.pumpWidget(EasyLocalization(
          path: 'assets/locales',
          supportedLocales: const [Locale('en')],
          child: const App()));

      act:
      () async {
        await Future.delayed(const Duration(seconds: 3));
      };
      await tester.pumpAndSettle();
      expect(find.text("Main screen"), findsOneWidget);
    });
  }, skip: false);
}
