import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_game/bloc/memory_game_bloc.dart';
import 'package:memory_game/cubit/timer_cubit.dart';
import 'package:memory_game/widgets/succes_dialog.dart';

class StartButton extends StatelessWidget {
  final double? hieght;
  final String text;
  const StartButton({super.key, this.hieght, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: hieght,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          textStyle: Theme.of(context).textTheme.displayMedium,
        ),
        onPressed: () {
          context.read<MemoryGameBloc>().add(StartGame());
          context.read<TimerCubit>().startTime();
        },
        child: Text(text),
      ),
    );
  }
}
