part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  final Map<Product, int> cartItems;
  const CartState({required this.cartItems});
  @override
  List<Object?> get props => [cartItems];
}

class CartLoaded extends CartState {
  const CartLoaded({required Map<Product, int> cartItems})
    : super(cartItems: cartItems);

  int get totalItems =>
      cartItems.values.fold(0, (prev, quantity) => prev + quantity);

  double get totalPrice => cartItems.entries.fold(
    0,
    (prev, entry) =>
        prev +
        ((entry.key.price -
                (entry.key.price * (entry.key.discountPercentage / 100))) *
            entry.value),
  );
}
