import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(const WishlistState.initial()) {
    on<SwitchView>(_switchView);
  }

  void _switchView(
    SwitchView event,
    Emitter<WishlistState> emit,
  ) {
    emit(
      state.copyWith(
        wishlistView: event.wishlistView,
      ),
    );
  }
}
