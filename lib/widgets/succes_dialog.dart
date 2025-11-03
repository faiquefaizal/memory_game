import 'package:flutter/material.dart';
import 'package:memory_game/core/widgets/sizedWidget.dart';
import 'package:memory_game/core/theme/app_color.dart';

import 'package:memory_game/widgets/restart_button.dart';

class SuccessDialog extends StatelessWidget {
  final String finishTime;
  const SuccessDialog({super.key, required this.finishTime});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Congratulations!",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            VerticalSpace(size: 5),
            Text(
              "You Completed the game in :",
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(color: Colors.blueGrey),
            ),
            VerticalSpace(size: 5),
            Text(
              finishTime,
              style: Theme.of(
                context,
              ).textTheme.headlineLarge?.copyWith(color: AppColor.primary),
            ),
            VerticalSpace(size: 15),
            RestartButton(text: "Play Again"),
          ],
        ),
      ),
    );
  }
}
