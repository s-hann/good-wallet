part of 'wishlist_bloc.dart';

enum WishlistViewType { card, table }

enum WishlistStatus { initial, loading, success, failure }

class WishlistState extends Equatable {
  const WishlistState.__({
    this.wishlistView = WishlistViewType.card,
    this.wishlistStatus = WishlistStatus.initial,
    this.wishlistRepository,
  });

  const WishlistState.initial() : this.__();

  const WishlistState.loading()
      : this.__(wishlistStatus: WishlistStatus.loading);

  const WishlistState.success({
    required List<Object> wishlists,
  }) : this.__(
          wishlistStatus: WishlistStatus.success,
          wishlistRepository: wishlists,
        );

  const WishlistState.failure()
      : this.__(
          wishlistStatus: WishlistStatus.failure,
        );

  final WishlistViewType wishlistView;
  final WishlistStatus wishlistStatus;
  final List<Object>? wishlistRepository;

  WishlistState copyWith({
    WishlistViewType? wishlistView,
    WishlistStatus? wishlistStatus,
    List<Object>? wishlistRepository,
  }) {
    return WishlistState.__(
      wishlistView: wishlistView ?? this.wishlistView,
      wishlistStatus: wishlistStatus ?? this.wishlistStatus,
      wishlistRepository: wishlistRepository ?? this.wishlistRepository,
    );
  }

  @override
  List<Object?> get props => [
        wishlistView,
        wishlistStatus,
        wishlistRepository,
      ];
}
