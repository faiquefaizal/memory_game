import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_game/bloc/memory_game_bloc.dart';
import 'package:memory_game/cubit/timer_cubit.dart';
import 'package:memory_game/funtions/helper_funtion.dart';
import 'package:memory_game/model/card_list.dart';
import 'package:memory_game/theme/app_color.dart';
import 'package:memory_game/widgets/game_card.dart';
import 'package:memory_game/widgets/ongoing_state_widget.dart';
import 'package:memory_game/widgets/succes_dialog.dart';
import 'package:memory_game/widgets/success_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Memory Game"),
        actions: [
          BlocBuilder<TimerCubit, String>(
            builder: (context, state) {
              return Text(
                state,
                style: Theme.of(context).textTheme.displaySmall,
              );
            },
          ),
        ],
      ),
      body: BlocConsumer<MemoryGameBloc, MemoryGameState>(
        listener: (context, state) {
          if (state is SuccessState) {
            context.read<TimerCubit>().stopTimer();
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => SuccessDialog(finishTime: state.time),
            );
          }
        },
        builder: (context, state) {
          if (state is OngoingState) {
            return OngoingStateWidget(state: state);
          } else if (state is SuccessState) {
            return SuccessStateWidget(state: state);
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
