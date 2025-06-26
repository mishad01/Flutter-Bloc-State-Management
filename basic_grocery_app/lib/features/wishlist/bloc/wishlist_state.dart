part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

abstract class WishlistActionState extends WishlistState {}

final class WishlistInitial extends WishlistState {}

class WishlistTestViewNavigationState extends WishlistActionState {}

class WishListSuccessState extends WishlistState {
  final List<ProductDataModel> wishListItem;
  WishListSuccessState({required this.wishListItem});
}
