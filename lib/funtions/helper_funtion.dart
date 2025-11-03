import 'package:memory_game/bloc/memory_game_bloc.dart';

bool flipCheck(OngoingState state, int index, String image) {
  if (state.firstIndex == index ||
      state.secondIndex == index ||
      state.matched.contains(image)) {
    return true;
  }
  return false;
}
