import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../features/products/data/models/product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartLoaded(cartItems: {})) {
    on<AddProductToCartEvent>((event, emit) {
      final currentCart = Map<Product, int>.from(state.cartItems);
      if (currentCart.containsKey(event.product)) {
        currentCart[event.product] = currentCart[event.product]! + 1;
      } else {
        currentCart[event.product] = 1;
      }
      emit(CartLoaded(cartItems: currentCart));
    });

    on<IncreaseProductQuantityEvent>((event, emit) {
      final currentCart = Map<Product, int>.from(state.cartItems);
      if (currentCart.containsKey(event.product)) {
        currentCart[event.product] = currentCart[event.product]! + 1;
      } else {
        currentCart[event.product] = 1;
      }
      emit(CartLoaded(cartItems: currentCart));
    });

    on<DecreaseProductQuantityEvent>((event, emit) {
      final currentCart = Map<Product, int>.from(state.cartItems);
      if (currentCart.containsKey(event.product)) {
        int currentQuantity = currentCart[event.product]!;
        if (currentQuantity > 1) {
          currentCart[event.product] = currentQuantity - 1;
        } else {
          currentCart.remove(event.product);
        }
      }
      emit(CartLoaded(cartItems: currentCart));
    });
  }
}
