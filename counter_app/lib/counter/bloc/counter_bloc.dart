import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(count: 0)) {
    on<IncrementPressed>(
      (event, emit) {
        emit(CounterState(count: state.count + 1));
      },
    );
  }
}
