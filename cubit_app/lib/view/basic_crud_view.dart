import 'package:cubit_counter_app/cubit/crud/person_cubit.dart';
import 'package:cubit_counter_app/cubit/crud/person_state.dart';
import 'package:cubit_counter_app/model/person.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasicCrudView extends StatefulWidget {
  const BasicCrudView({super.key});

  @override
  State<BasicCrudView> createState() => _BasicCrudViewState();
}

class _BasicCrudViewState extends State<BasicCrudView> {
  @override
  void dispose() {
    super.dispose();
    context.read<PersonCubit>().dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Search ListView"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: context.read<PersonCubit>().nameController,
                decoration: InputDecoration(
                  label: Text("Name"),
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: context.read<PersonCubit>().addressController,
                decoration: InputDecoration(
                  label: Text("Address"),
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  final cubit = context.read<PersonCubit>();
                  cubit.addPerson(
                    cubit.nameController.text,
                    cubit.addressController.text,
                  );
                },
                child: Text(" Add Employee"),
              ),
              Expanded(
                child: BlocBuilder<PersonCubit, PersonState>(
                  builder: (context, state) {
                    if (state is PersonInitialState) {
                      return Center(child: Text("List is Empty"));
                    } else if (state is PersonUpdatedState) {
                      return buildPlayerList(state.persons);
                    }
                    return SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPlayerList(List<Person> persons) {
    return ListView.builder(
      itemCount: persons.length,
      itemBuilder: (context, index) {
        final person = persons[index];
        return ListTile(
          title: Text(person.name),
          subtitle: Text(person.address),
          trailing: IconButton(
            onPressed: () {
              context.read<PersonCubit>().removePerson(index);
            },
            icon: Icon(Icons.delete),
          ),
        );
      },
    );
  }
}
