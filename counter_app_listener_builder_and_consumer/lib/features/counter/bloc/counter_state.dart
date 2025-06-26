part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

class CounterIncrementState extends CounterState {
  final int count;
  CounterIncrementState(this.count);
}
