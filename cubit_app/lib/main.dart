import 'package:cubit_counter_app/cubit/counter/counter_cubit.dart';
import 'package:cubit_counter_app/cubit/crud/person_cubit.dart';
import 'package:cubit_counter_app/cubit/image_picker/image_cubit.dart';
import 'package:cubit_counter_app/cubit/navigation/navigation_cubit.dart';
import 'package:cubit_counter_app/cubit/search/player_cubit.dart';
import 'package:cubit_counter_app/cubit/theme/theme_cubit.dart';
import 'package:cubit_counter_app/cubit/theme/theme_state.dart';
import 'package:cubit_counter_app/view/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(create: (_) => CounterCubit()),
        BlocProvider<PlayerCubit>(create: (_) => PlayerCubit()),
        BlocProvider<ImageCubit>(create: (_) => ImageCubit()),
        BlocProvider<PersonCubit>(create: (_) => PersonCubit()),
        BlocProvider<ThemeCubit>(
          create: (context) {
            final themeCubit = ThemeCubit();
            themeCubit.setInitialTheme();
            return themeCubit;
          },
        ),
        BlocProvider<NavigationCubit>(create: (_) => NavigationCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: state.themeData,
          home: BottomNavBar(),
        );
      },
    );
  }
}
