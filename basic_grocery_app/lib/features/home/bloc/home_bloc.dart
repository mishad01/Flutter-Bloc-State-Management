import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>((event, emit) {
      emit(HomeInitial());
    });

    on<HomeWishListNavigationButtonEvent>((event, emit) {
      emit(HomeWishlistNavigateState());
    });

    on<HomeCartListNavigationButtonEvent>(
      (event, emit) {
        emit(HomeCartListNavigateState());
      },
    );
  }
}
