part of 'counter_bloc.dart';

sealed class CounterState extends Equatable {
  final int value;
  const CounterState(this.value);

  @override
  List<Object> get props => [value];
}

final class CounterInitial extends CounterState {
  const CounterInitial(int value) : super(value);
}

final class CounterChange extends CounterState {
  const CounterChange(int value) : super(value);
}
