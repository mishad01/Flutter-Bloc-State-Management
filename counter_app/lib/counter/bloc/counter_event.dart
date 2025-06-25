part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class IncrementPressed extends CounterEvent {}
