import 'dart:developer';

import 'package:memory_game/bloc/memory_game_bloc.dart';
import 'package:memory_game/model/card_list.dart';

// Checks if a card should be shown as flipped (face up).

// Returns `true` if the card's [index] matches the first or second
// selected card in the [state], or if the card's [image] is already
// in the list of matched pairs. Otherwise, returns `false`.
bool flipCheck(OngoingState state, int index, String image) {
  if (state.firstIndex == index ||
      state.secondIndex == index ||
      state.matched.contains(image)) {
    return true;
  }
  return false;
}

// Creates and returns a new shuffled list for the game.

// It takes the base `cardList` (which contains 8 pairs of images),
//shuffles it in place, and returns it.
List<String> generateList() {
  log(cardList.toString());
  return cardList..shuffle();
}

/// Helper function to format a [Duration] into a "MM:SS" string.
String timeFormat(Duration time) {
  // Get the seconds part (0-59)
  String seconds = twoDigit(time.inSeconds.remainder(60));
  // Get the minutes part (0-59)
  String minutes = twoDigit(time.inMinutes.remainder(60));

  return "$minutes:$seconds";
}

/// Helper function to format an integer into a two-digit string.
/// Example: 5 -> "05", 12 -> "12"
String twoDigit(int time) {
  return time.toString().padLeft(2, "0");
}
