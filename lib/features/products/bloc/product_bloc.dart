import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../data/models/product_model.dart';
import '../data/repositories/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;
  final int limit = 10;
  int skip = 0;

  ProductBloc({required this.repository}) : super(ProductInitial()) {
    on<FetchProductsEvent>((event, emit) async {
      // Prevent further requests if we've reached max products
      if (state is ProductLoaded &&
          (state as ProductLoaded).hasReachedMax &&
          !event.isRefresh)
        return;

      try {
        // Handle refresh
        if (event.isRefresh) {
          skip = 0;
          final products = await repository.fetchProducts(
            limit: limit,
            skip: skip,
          );
          skip += products.length;
          emit(
            ProductLoaded(
              products: products,
              isLoadingMore: false,
              hasReachedMax: products.length < limit,
            ),
          );
        } else if (state is ProductInitial) {
          final products = await repository.fetchProducts(
            limit: limit,
            skip: skip,
          );
          skip += products.length;
          emit(
            ProductLoaded(
              products: products,
              isLoadingMore: false,
              hasReachedMax: products.length < limit,
            ),
          );
        } else if (state is ProductLoaded) {
          final currentState = state as ProductLoaded;
          emit(
            ProductLoaded(
              products: currentState.products,
              isLoadingMore: true,
              hasReachedMax: currentState.hasReachedMax,
            ),
          );
          final newProducts = await repository.fetchProducts(
            limit: limit,
            skip: skip,
          );
          if (newProducts.isEmpty) {
            // No more products available
            emit(
              ProductLoaded(
                products: currentState.products,
                isLoadingMore: false,
                hasReachedMax: true,
              ),
            );
          } else {
            skip += newProducts.length;
            emit(
              ProductLoaded(
                products: currentState.products + newProducts,
                isLoadingMore: false,
                hasReachedMax: newProducts.length < limit,
              ),
            );
          }
        }
      } catch (e) {
        debugPrint(e.toString());
        emit(ProductError(message: e.toString()));
        // throw (e);
      }
    });
  }
}
