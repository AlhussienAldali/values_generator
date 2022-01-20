import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:values_generator/features/app_launcher/bloc/app_launcher_bloc.dart';

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
}
