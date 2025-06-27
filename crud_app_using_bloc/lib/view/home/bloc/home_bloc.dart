import 'package:bloc/bloc.dart';
import 'package:crud_app_using_bloc/model/product_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<HomeToAddViewNavigateEvent>(
      (event, emit) {
        emit(HomeToAddViewNavigateState());
      },
    );

    on<HomeToUpdateViewNavigateEvent>(
      (event, emit) {
        emit(HomeToUpdateViewNavigateState(event.product));
      },
    );
  }
}
