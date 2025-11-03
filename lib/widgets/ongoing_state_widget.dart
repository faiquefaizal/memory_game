import 'package:flutter/material.dart';
import 'package:memory_game/bloc/memory_game_bloc.dart';
import 'package:memory_game/funtions/helper_funtion.dart';
import 'package:memory_game/widgets/game_card.dart';

class OngoingStateWidget extends StatelessWidget {
  final OngoingState state;
  const OngoingStateWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 0.7,
      ),
      itemCount: state.list.length,
      itemBuilder: (context, index) {
        final card = state.list[index];
        final flip = flipCheck(state, index, card);
        return GameCard(imagePath: card, flipped: flip, index: index);
      },
    );
  }
}
