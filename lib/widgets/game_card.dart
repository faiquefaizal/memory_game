// import 'package:animated_flip_card/animated_flip_card.dart';
// import 'package:flip_card/flip_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:memory_game/bloc/memory_game_bloc.dart';
// import 'package:memory_game/cubit/timer_cubit.dart';
// import 'package:memory_game/widgets/back_card.dart';
// import 'package:memory_game/widgets/front_card.dart';

// class GameCard extends StatelessWidget {
//   final String imagePath;
//   final bool flipped;

//   final int index;

//   const GameCard({
//     super.key,
//     required this.imagePath,
//     required this.flipped,
//     required this.index,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         InkWell(
//           onTap: () {
//             log("$imagePath,${index.toString()}");
//             context.read<MemoryGameBloc>().add(
//               SelectCard(imagePath, context.read<TimerCubit>().state, index),
//             );
//           },
//           child: FlipCard(

//             flipOnTouch: false,
//             front: FrontCard(imagePath: imagePath),
//             back: BackCard(),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_game/bloc/memory_game_bloc.dart';
import 'package:memory_game/cubit/timer_cubit.dart';
import 'package:memory_game/theme/app_color.dart';

import 'package:flip_card/flip_card.dart';
import 'package:memory_game/widgets/back_card.dart';
import 'package:memory_game/widgets/front_card.dart';

class GameCard extends StatefulWidget {
  final String imagePath;
  final bool flipped;
  final int index;

  const GameCard({
    super.key,
    required this.imagePath,
    required this.flipped,
    required this.index,
  });

  @override
  State<GameCard> createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  void didUpdateWidget(GameCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.flipped != oldWidget.flipped) {
      final bool isCardShowingFront = cardKey.currentState!.isFront;

      if (widget.flipped && isCardShowingFront) {
        cardKey.currentState!.toggleCard();
      } else if (!widget.flipped && !isCardShowingFront) {
        cardKey.currentState!.toggleCard();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        log("${widget.imagePath},${widget.index.toString()}");
        context.read<MemoryGameBloc>().add(
          SelectCard(
            widget.imagePath,
            context.read<TimerCubit>().state,
            widget.index,
          ),
        );
      },
      child: FlipCard(
        key: cardKey,

        flipOnTouch: false,

        direction: FlipDirection.HORIZONTAL,

        front: BackCard(),
        back: FrontCard(imagePath: widget.imagePath),
      ),
    );
  }
}
