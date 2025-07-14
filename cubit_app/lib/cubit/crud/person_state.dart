import 'package:cubit_counter_app/model/person.dart';

abstract class PersonState {}

final class PersonInitialState extends PersonState {}

final class PersonUpdatedState extends PersonState {
  final List<Person> persons;
  PersonUpdatedState({required this.persons});
}
