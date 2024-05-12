import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_banking/blocs/tab/tab_event.dart';
import 'package:mobile_banking/blocs/tab/tab_state.dart';

class BottomBloc extends Bloc<ChangeIndexEvent, ChangeIndexState> {
  BottomBloc() : super(ChangeIndexState(index: 0)) {
    on<ChangeIndexEvent>((event, emit) {
      emit(state.copyWith(index: event.index));
    });
  }
}