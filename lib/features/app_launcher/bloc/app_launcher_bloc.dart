import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
part 'app_launcher_event.dart';
part 'app_launcher_state.dart';

@Injectable()
class AppLauncherBloc extends Bloc<AppLauncherEvent,AppLauncherState>{
  AppLauncherBloc() : super(AppLauncherInitial())  {
    endLauncher();
  }
  endLauncher()async{
    await Future.delayed(const Duration(seconds:3));
    emit(AppLauncherFinished());
  }
}
