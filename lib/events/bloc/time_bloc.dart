import 'dart:async';

import 'package:bloc_counter_app/events/bloc/time_library.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// kiểu Bloc có đầu vào là event, đầu ra là state
class TimeBloc extends Bloc<TimeEvent, TimeState> {
  static int _timeDuration = 890;

  TimeBloc() : super(InitialState(_timeDuration));
  late StreamSubscription<int> _timeSubcription;
  @override
  Stream<TimeState> mapEventToState(TimeEvent event) async* {
    // TODO: implement mapEventToState
    if (event is StartEvent) {
      yield RunningState(event.timeDuration);
      _timeSubcription.cancel();
      int time = changeTime(event.timeDuration).listen((timeDuration) {
        return add(RunEvent(timeDuration));
      }) as int;
      _timeDuration = time;
    } else if (event is RunEvent) {
      yield event.timeDuration > 0
          ? RunningState(event.timeDuration)
          : CompleteState();
    } else if (event is PausedEvent) {
      _timeSubcription.pause();
      yield PauseState(state.timeDuration);
    } else if (event is ResumeEvent) {
      _timeSubcription.resume();
      yield RunningState(state.timeDuration);
    } else if (event is ResetEvent) {
      _timeSubcription.cancel();
      yield InitialState(_timeDuration);
    }
  }

  Stream<int> changeTime(int time) {
    return Stream.periodic(const Duration(seconds: 1), (x) => time - x - 1)
        .take(time);
  }
}
