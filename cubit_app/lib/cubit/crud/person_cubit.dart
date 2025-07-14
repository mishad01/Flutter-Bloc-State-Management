import 'package:cubit_counter_app/cubit/crud/person_state.dart';
import 'package:cubit_counter_app/model/person.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonCubit extends Cubit<PersonState> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  List<Person> personList = [];
  PersonCubit() : super(PersonInitialState());

  void addPerson(String name, String address) {
    personList.add(Person(name: name, address: address));
    emit(PersonUpdatedState(persons: personList));
    nameController.clear();
    addressController.clear();
  }

  void removePerson(int index) {
    personList.removeAt(index);
    if (personList.isEmpty) {
      emit(PersonInitialState());
    } else {
      emit(PersonUpdatedState(persons: personList));
    }
  }

  void dispose() {
    nameController.dispose();
    addressController.dispose();
  }
}
