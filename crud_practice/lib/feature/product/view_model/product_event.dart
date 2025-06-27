part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

final class ProductFetchEvent extends ProductEvent {}

final class ProductDeleteEvent extends ProductEvent {
  final String id;
  ProductDeleteEvent({required this.id});
}
