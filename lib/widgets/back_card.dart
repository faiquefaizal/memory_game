import 'package:flutter/material.dart';
import 'package:memory_game/theme/app_color.dart';

class BackCard extends StatelessWidget {
  const BackCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 100,

      decoration: BoxDecoration(
        color: AppColor.primary,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Icon(Icons.question_mark_sharp),
    );
  }
}
