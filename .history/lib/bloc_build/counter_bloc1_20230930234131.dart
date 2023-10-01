import 'package:bloc/bloc.dart';

class CounterEvent1 {}

class CounterIncrementPressed extends CounterEvent1 {}

class CounterDecrementPressed extends CounterEvent1 {}

class CounterBloc extends Bloc<CounterEvent1, int> {
  CounterBloc() : super(0) {
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
