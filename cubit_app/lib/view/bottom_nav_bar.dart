import 'package:cubit_counter_app/cubit/navigation/navigation_cubit.dart';
import 'package:cubit_counter_app/cubit/navigation/navigation_state.dart';
import 'package:cubit_counter_app/view/counter_view.dart';
import 'package:cubit_counter_app/view/image_picker_view.dart';
import 'package:cubit_counter_app/view/search_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> _screens = const [
    CounterView(title: "Counter App"),
    ImagePickerView(),
    SearchListView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return _screens[state.selectedIndex];
        },
      ),
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return NavigationBar(
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                label: 'Counter',
                selectedIcon: Icon(Icons.home),
              ),
              NavigationDestination(
                icon: Icon(Icons.image_outlined),
                label: 'ImagePicker',
                selectedIcon: Icon(Icons.image),
              ),

              NavigationDestination(
                icon: Icon(Icons.search_outlined),
                label: 'Search Item',
                selectedIcon: Icon(Icons.search),
              ),
            ],
            selectedIndex: state.selectedIndex,
            onDestinationSelected: (index) {
              context.read<NavigationCubit>().setSelectedIndex(index);
            },
          );
        },
      ),
    );
  }
}
