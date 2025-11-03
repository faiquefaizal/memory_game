part of 'memory_game_bloc.dart';

@immutable
sealed class MemoryGameState {}

final class MemoryGameInitial extends MemoryGameState {}

final class OngoingState extends MemoryGameState {
  final List<String> list;
  final int? firstIndex;
  final int? secondIndex;
  final Set<String> matched;
  OngoingState({
    required this.list,
    this.firstIndex,
    this.secondIndex,
    required this.matched,
  });
  OngoingState copyWith({
    List<String>? list,
    int? firstIndex,
    int? secondIndex,
    Set<String>? matched,
  }) {
    log("first index when copy with is called ${firstIndex.toString()}");
    return OngoingState(
      list: list ?? this.list,
      firstIndex: firstIndex ?? this.firstIndex,
      secondIndex: secondIndex ?? this.secondIndex,
      matched: matched ?? this.matched,
    );
  }

  @override
  String toString() {
    return "$list,$firstIndex,$secondIndex,$matched";
  }
}

final class SuccessState extends MemoryGameState {
  final String time;
  final List<String> list;
  SuccessState(this.time, this.list);
}
