import 'package:counter_app_listener_builder_and_consumer/features/counter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  CounterBloc counterBloc = CounterBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    counterBloc.add(CounterIncrementEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterBloc.add(CounterIncrementEvent());
        },
        child: Icon(Icons.add),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        bloc: counterBloc,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CounterIncrementState:
              final successState = state as CounterIncrementState;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      successState.count.toString(),
                      style: TextStyle(fontSize: 32),
                    ),
                  ],
                ),
              );
            default:
          }
          return Center(
            child: Text("Not Found"),
          );
        },
      ),
    );
  }
}
