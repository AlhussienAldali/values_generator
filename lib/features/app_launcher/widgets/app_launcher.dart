import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:values_generator/core/di/di.dart';
import 'package:values_generator/core/ui_constrains/app_colors.dart';
import 'package:values_generator/features/app_launcher/bloc/app_launcher_bloc.dart';

class AppLauncher extends StatefulWidget {
  const AppLauncher({Key? key}) : super(key: key);

  @override
  _AppLauncherState createState() => _AppLauncherState();
}

class _AppLauncherState extends State<AppLauncher> {

  late AppLauncherBloc _appLauncherBloc;

  @override
  void initState() {
    super.initState();
    _appLauncherBloc = getIt.get<AppLauncherBloc>();
  }

  @override
  void dispose() {
    _appLauncherBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AppLauncherBloc,AppLauncherState>(
        bloc: _appLauncherBloc,
        listener: (context, state) {
          if(state is AppLauncherFinished) {
            Navigator.pushNamed(context, '/mainScreen');
          }
        },
        child: Container(
          color: AppColors.lightGrey,
          child: const Center(
            child: Image(
              image: AssetImage(
                "assets/images/app_launcher.png",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
