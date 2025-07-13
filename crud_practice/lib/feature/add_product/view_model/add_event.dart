part of 'add_bloc.dart';

@immutable
sealed class AddEvent {}

final class AddProductEvent extends AddEvent {
  final ProductModel product;
  AddProductEvent({required this.product});
}
