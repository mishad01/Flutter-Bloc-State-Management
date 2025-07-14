import 'package:cubit_counter_app/cubit/counter/counter_cubit.dart';
import 'package:cubit_counter_app/cubit/image_picker/image_cubit.dart';
import 'package:cubit_counter_app/cubit/search/player_cubit.dart';
import 'package:cubit_counter_app/view/image_picker_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<CounterCubit>(create: (context) => CounterCubit()),
          BlocProvider<PlayerCubit>(create: (context) => PlayerCubit()),
          BlocProvider<ImageCubit>(create: (context) => ImageCubit()),
        ],
        child: ImagePickerView(),
      ),
    );
  }
}
