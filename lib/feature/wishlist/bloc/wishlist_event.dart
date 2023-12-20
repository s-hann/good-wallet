part of 'wishlist_bloc.dart';

class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class SwitchView extends WishlistEvent {
  const SwitchView({required this.wishlistView});

  final WishlistViewType wishlistView;

  @override
  List<Object> get props => [wishlistView];
}
