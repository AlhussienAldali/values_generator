part of 'app_launcher_bloc.dart';

@immutable
abstract class AppLauncherState  extends Equatable{
  @override
  List<Object> get props => [];
}

class AppLauncherInitial extends AppLauncherState {}

class AppLauncherFinished extends AppLauncherState {}

