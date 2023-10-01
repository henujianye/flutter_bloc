import 'dart:html';

import 'package:bloc/bloc.dart';

class CounterEvent {}

class CounterIncrementPressed extends CounterEvent {}

class CounterDecrementPressed extends CounterEvent {}

class CounterBloc1 extends Bloc<CounterEvent, int> {
  CounterBloc1() : super(0) {
    on<CounterIncrementPressed>(((event, emit) {
      emit(state + 1);
    }));

    on<CounterDecrementPressed>(
      (event, emit) {
        emit(state - 1);
      },
    );
  }
}
