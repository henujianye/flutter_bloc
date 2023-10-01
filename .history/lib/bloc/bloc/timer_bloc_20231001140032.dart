import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final Ticker _ticker;

  static const int _duration = 60;

  TimerBloc() : super(TimerInitial(_duration)) {
    on<TimerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
