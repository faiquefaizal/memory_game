import 'package:flutter/material.dart';
import 'package:memory_game/core/widgets/sizedWidget.dart';
import 'package:memory_game/widgets/custem_widget.dart';

class StartScreenWidget extends StatelessWidget {
  const StartScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              "Memory Card Game",
              style: Theme.of(context).textTheme.headlineLarge,
            ),

            Text(
              "Test your memory and match the cards!",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            VerticalSpace(size: 20),
            StartButton(text: "Start Game"),
          ],
        ),
      ),
    );
  }
}
