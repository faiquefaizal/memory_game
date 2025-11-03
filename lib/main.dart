import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_game/bloc/memory_game_bloc.dart';
import 'package:memory_game/core/theme/app_theme.dart';
import 'package:memory_game/cubit/timer_cubit.dart';
import 'package:memory_game/home_screen.dart';
import 'package:memory_game/screens/start_screen.dart';
import 'package:memory_game/theme/app_color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TimerCubit()),
        BlocProvider(create: (context) => MemoryGameBloc()),
      ],
      child: MaterialApp(theme: appTheme, home: StartScreen()),
    );
  }
}
