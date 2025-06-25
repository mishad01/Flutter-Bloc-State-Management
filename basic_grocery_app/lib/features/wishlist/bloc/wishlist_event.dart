part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class WishListTestViewButtonEvent extends WishlistEvent {}
