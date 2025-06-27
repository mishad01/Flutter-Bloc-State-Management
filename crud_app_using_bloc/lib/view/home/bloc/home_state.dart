part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

final class HomeToAddViewNavigateState extends HomeActionState {}

final class HomeToUpdateViewNavigateState extends HomeActionState {
  final ProductModel product;
  HomeToUpdateViewNavigateState(this.product);
}
