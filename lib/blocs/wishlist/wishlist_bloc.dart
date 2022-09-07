import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/models/wishlist.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<StartWishlist>(_mapStartWishlistToState);
    on<AddWishlistProduct>(_mapAddWishlistProductToState);
    on<RemoveWishlistProduct>(_mapRemoveWishlistProductToState);
  }

  void _mapStartWishlistToState(event, Emitter<WishlistState> emit) async {
    emit(WishlistLoading());
    try {
      await Future<void>.delayed(Duration(seconds: 1));
      emit(WishlistLoaded());
    } catch (_) {}
  }

  void _mapAddWishlistProductToState(event, Emitter<WishlistState> emit) {
    final state = this.state;
    if (state is WishlistLoaded) {
      try {
        emit(
          WishlistLoaded(
            wishlist: Wishlist(
              products: List.from(state.wishlist.products)..add(event.product),
            ),
          ),
        );
      } catch (_) {}
    } else if (state is WishlistLoading) {}
  }

  void _mapRemoveWishlistProductToState(event, Emitter<WishlistState> emit) {
    final state = this.state;
    if (state is WishlistLoaded) {
      try {
        emit(
          WishlistLoaded(
            wishlist: Wishlist(
              products: List.from(state.wishlist.products)
                ..remove(event.product),
            ),
          ),
        );
      } catch (_) {}
    } else if (state is WishlistLoading) {}
  }
}
