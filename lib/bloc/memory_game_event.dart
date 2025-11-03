part of 'memory_game_bloc.dart';

@immutable
sealed class MemoryGameEvent {}

final class StartGame extends MemoryGameEvent {}

final class SelectCard extends MemoryGameEvent {
  final String card;
  final String time;
  final int index;
  SelectCard(this.card, this.time, this.index);
}
