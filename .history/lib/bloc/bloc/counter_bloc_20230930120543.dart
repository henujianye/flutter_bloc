import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial(0)) {
    on<CounterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  int counterNum = 0;

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is CounterIncrement) {
      yield* _mapIncrementEventToState(event);
    } else if (event is CounterSubduction) {
      yield* _mapSubductionEventToState(event);
    }
  }

  Stream<CounterState> _mapIncrementEventToState(
      CounterIncrement event) async* {
    this.counterNum += 1;
    yield CounterChange(this.counterNum);
  }

  Stream<CounterState> _mapSubductionEventToState(
      CounterSubduction event) async* {
    this.counterNum -= 1;
    yield CounterChange(this.counterNum);
  }
}
