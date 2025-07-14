import 'package:bloc/bloc.dart';
import 'package:cubit_counter_app/cubit/navigation/navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(0));

  setSelectedIndex(int index) {
    emit(NavigationState(index));
  }
}
