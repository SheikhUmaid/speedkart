part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
  @override
  List<Object?> get props => [];
}

class FetchProductsEvent extends ProductEvent {
  /// isRefresh flag to trigger a complete refresh of the product list.
  final bool isRefresh;
  const FetchProductsEvent({this.isRefresh = false});

  @override
  List<Object?> get props => [isRefresh];
}
