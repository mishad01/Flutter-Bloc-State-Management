part of 'add_bloc.dart';

@immutable
sealed class AddEvent {}

class AddButtonEvent extends AddEvent {}

class AddProductEvent extends AddEvent {
  final ProductModel product;
  AddProductEvent(this.product);
}
