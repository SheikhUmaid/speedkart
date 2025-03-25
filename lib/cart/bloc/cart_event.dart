part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
  @override
  List<Object?> get props => [];
}

class AddProductToCartEvent extends CartEvent {
  final Product product;
  const AddProductToCartEvent({required this.product});
  @override
  List<Object?> get props => [product];
}

class IncreaseProductQuantityEvent extends CartEvent {
  final Product product;
  const IncreaseProductQuantityEvent({required this.product});
  @override
  List<Object?> get props => [product];
}

class DecreaseProductQuantityEvent extends CartEvent {
  final Product product;
  const DecreaseProductQuantityEvent({required this.product});
  @override
  List<Object?> get props => [product];
}
