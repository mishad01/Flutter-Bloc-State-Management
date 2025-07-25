part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeToAddViewNavigateEvent extends HomeEvent {}

class HomeToUpdateViewNavigateEvent extends HomeEvent {
  final ProductModel product;
  HomeToUpdateViewNavigateEvent(this.product);
}
