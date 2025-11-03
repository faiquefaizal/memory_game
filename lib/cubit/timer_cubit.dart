import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<String> {
  Timer? _timer;
  TimerCubit() : super("00:00");
  void startTime() {
    _timer?.cancel();
    int time = 0;
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      time++;
      emit(timeFormat(Duration(seconds: time)));
    });
  }

  void stopTimer() {
    _timer?.cancel();
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}

String timeFormat(Duration time) {
  String seconds = twoDigit(time.inSeconds.remainder(60));
  String minutes = twoDigit(time.inMinutes.remainder(60));
  return "$minutes:$seconds";
}

String twoDigit(int time) {
  return time.toString().padLeft(2, "0");
}
