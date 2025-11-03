import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:memory_game/model/card_list.dart';
import 'package:meta/meta.dart';

part 'memory_game_event.dart';
part 'memory_game_state.dart';

class MemoryGameBloc extends Bloc<MemoryGameEvent, MemoryGameState> {
  MemoryGameBloc() : super(MemoryGameInitial()) {
    on<StartGame>(_startGame);
    on<SelectCard>(_cardSelect);
  }
  _startGame(StartGame event, Emitter<MemoryGameState> emit) {
    List<String> cards = generateList();
    emit(
      OngoingState(
        list: cards,
        firstIndex: null,
        secondIndex: null,
        matched: {},
      ),
    );
  }

  _cardSelect(SelectCard event, Emitter<MemoryGameState> emit) async {
    if (state is! OngoingState) return;
    // log("after thr ${state.toString()}");
    final currentState = state as OngoingState;
    final currentIndex = event.index;
    log(currentState.list.toString());
    if (currentState.secondIndex != null) return;
    if (currentState.matched.contains(event.card)) return;
    if (currentState.firstIndex == null) {
      emit(currentState.copyWith(firstIndex: currentIndex));
      return;
    }
    if (currentIndex == currentState.firstIndex) return;
    if (currentState.secondIndex == null) {
      emit(currentState.copyWith(secondIndex: currentIndex));

      await Future.delayed(Duration(seconds: 1));
    }
    if (currentState.list[currentState.firstIndex!] ==
        currentState.list[currentIndex]) {
      final Set<String> matched = Set.from(currentState.matched)
        ..add(event.card);

      if (matched.length == 8) {
        emit(SuccessState(event.time, currentState.list));
      } else {
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
