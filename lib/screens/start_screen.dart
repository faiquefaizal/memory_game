import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_game/bloc/memory_game_bloc.dart';
import 'package:memory_game/core/widgets/sizedWidget.dart';
import 'package:memory_game/cubit/timer_cubit.dart';
import 'package:memory_game/screens/home_screen.dart';
import 'package:memory_game/widgets/start_button.dart';
import 'package:memory_game/widgets/start_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MemoryGameBloc, MemoryGameState>(
        listener: (context, state) {
          if (state is OngoingState) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          }
        },
        builder: (context, state) {
          if (state is MemoryGameInitial) {
            return StartScreenWidget();
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
