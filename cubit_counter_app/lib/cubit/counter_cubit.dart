import 'package:cubit_counter_app/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(count: 0));

  void increment() => emit(CounterState(count: state.count + 1));
  void decrement() => emit(CounterState(count: state.count - 1));
}
