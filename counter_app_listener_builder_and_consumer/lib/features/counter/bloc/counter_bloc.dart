import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int value = 0;
  CounterBloc() : super(CounterInitial()) {
    on<CounterIncrementEvent>(
      (event, emit) {
        value = value + 1;
        emit(CounterIncrementState(value));
      },
    );
  }
}
