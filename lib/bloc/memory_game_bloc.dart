import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:memory_game/funtions/helper_funtion.dart';
import 'package:memory_game/model/card_list.dart';
import 'package:meta/meta.dart';

part 'memory_game_event.dart';
part 'memory_game_state.dart';

class MemoryGameBloc extends Bloc<MemoryGameEvent, MemoryGameState> {
  MemoryGameBloc() : super(MemoryGameInitial()) {
    // When a 'StartGame' event is added, call the '_startGame' function
    on<StartGame>(_startGame);
    // When a 'SelectCard' event is added, call the '_cardSelect' function
    on<SelectCard>(_cardSelect);
  }

  // Handles the StartGame event
  _startGame(StartGame event, Emitter<MemoryGameState> emit) {
    // 1. Get a new, shuffled list of cards
    List<String> cards = generateList();
    // 2. Emit the 'OngoingState' to start the game
    emit(
      OngoingState(
        list: cards,
        firstIndex: null,
        secondIndex: null,
        matched: {},
      ),
    );
  }

  // Handles the SelectCard event
  _cardSelect(SelectCard event, Emitter<MemoryGameState> emit) async {
    // Guard: Only run this logic if the game is actually in progress
    if (state is! OngoingState) return;
    // log("after thr ${state.toString()}");

    // Cast the current state to 'OngoingState' to access its properties
    final currentState = state as OngoingState;
    final currentIndex = event.index;
    log(currentState.list.toString());

    // If two cards are already flipped (waiting for the delay), ignore this click.
    if (currentState.secondIndex != null) return;

    // If the clicked card is already in the matched set, ignore this click.
    if (currentState.matched.contains(event.card)) return;
    if (currentState.firstIndex == null) {
      // This is the first card being flipped in this turn.
      // Emit a new state with 'firstIndex' set to the clicked card's index.
      emit(currentState.copyWith(firstIndex: currentIndex));
      return;
    }
    // If the user clicked the *same card* they just clicked first, ignore it.
    if (currentIndex == currentState.firstIndex) return;
    if (currentState.secondIndex == null) {
      // This is the second card being flipped.
      // Emit a new state showing the second card flipped.
      emit(currentState.copyWith(secondIndex: currentIndex));

      // Pause for 1 second so the user can see both cards
      await Future.delayed(Duration(seconds: 1));
    }

    // This code runs *after* the 1-second delay.
    // We check if the card image at firstIndex matches the card image at currentIndex.
    // We use 'currentState.firstIndex!' because we know it's not null here.
    if (currentState.list[currentState.firstIndex!] ==
        currentState.list[currentIndex]) {
      final Set<String> matched = Set.from(currentState.matched)
        ..add(event.card);
      // IT'S A MATCH!

      // Create a new 'matched' set by copying the old one and adding the new card.
      // --- Win Condition Check ---
      if (matched.length == 8) {
        // 8 pairs
        // The user has matched all 8 pairs.
        // Emit the 'SuccessState' with the time and the final list.
        emit(SuccessState(event.time, currentState.list));
      } else {
        // Not a win yet, but it's a match.
        // Emit a new 'OngoingState', clearing the first/second index
        // and adding the new matched pair to the 'matched' set.

        emit(
          OngoingState(
            list: currentState.list,
            firstIndex: null,
            secondIndex: null,
            matched: matched,
          ),
        );
        return;
      }
    } else {
      // await Future.delayed(Duration(seconds: 2));
      emit(
        OngoingState(
          list: currentState.list,
          firstIndex: null,
          secondIndex: null,
          matched: currentState.matched,
        ),
      );
    }
  }
}
