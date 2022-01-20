
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:values_generator/features/add_value/repository/add_value_repo.dart';

part 'add_value_event.dart';
part 'add_value_state.dart';

@injectable
class AddValueBloc extends Bloc<AddValueEvent, AddValueState> {
  AddValueRepo addValueRepo = AddValueRepo();
  AddValueBloc() : super(AddValueInitial()) {
    on<AddValueEvent>((event, emit) async {
          if(event is SaveValue) {
            emit(LoadingState());
            addValueRepo.saveToLocalStorage(event.valueText);
            await Future.delayed(const Duration(seconds:2));
            emit(NewValueAddedSuccessfully());

          }
          if(event is ReAddValue)
            {
              emit(AddValueInitial());
            }

    });
  }
}
