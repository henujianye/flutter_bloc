part of 'timer_bloc.dart';

sealed class TimerState extends Equatable {
  final int duration;
  const TimerState(this.duration);

  @override
  List<Object> get props => [duration];
}

final class TimerInitial extends TimerState {}
