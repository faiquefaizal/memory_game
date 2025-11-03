import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_game/bloc/memory_game_bloc.dart';
import 'package:memory_game/cubit/timer_cubit.dart';
import 'package:memory_game/theme/app_color.dart';

class RestartButton extends StatelessWidget {
  final String text;
  const RestartButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          context.read<MemoryGameBloc>().add(StartGame());
          context.read<TimerCubit>().startTime();
          Navigator.of(context).pop();
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.restart_alt, size: 22),
            const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                fontFamily: 'Spline Sans',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColor.scaffoldColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
