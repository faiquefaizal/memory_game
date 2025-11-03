import 'package:flutter/material.dart';
import 'package:memory_game/theme/app_color.dart';

class FrontCard extends StatelessWidget {
  final String imagePath;
  const FrontCard({super.key, required this.imagePath});

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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),

        child: Image.asset(imagePath),
      ),
    );
  }
}
