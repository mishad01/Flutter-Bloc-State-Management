part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

abstract class CartActionState extends CartState {}

class CartInitial extends CartState {}

class CartPaymentViewNavigateState extends CartActionState {}
