import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_model.dart';
import 'product_service.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;
  final bool hasMore;

  ProductLoaded(this.products, {this.hasMore = true});
}

class ProductError extends ProductState {
  ProductError(this.message);
  final String message;
}

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._service) : super(ProductInitial());

  final ProductService _service;
  final List<Product> _allProducts = [];
  int _offset = 0;
  final int _limit = 10;
  bool _isFetching = false;

  Future<void> fetchProducts(int categoryId, {bool reset = false}) async {
    if (_isFetching) return;
    _isFetching = true;

    if (reset) {
      _offset = 0;
      _allProducts.clear();
      emit(ProductLoading());
    }

    try {
      final response = await _service.fetchProductsByCategory(
        categoryId,
        offset: _offset,
        limit: _limit,
      );

      final products = response.data;
      _allProducts.addAll(products);
      _offset += _limit;

      emit(ProductLoaded(
        List<Product>.from(_allProducts),
        hasMore: products.length == _limit,
      ));
    } catch (e) {
      emit(ProductError('Ürünler yüklenemedi: $e'));
    } finally {
      _isFetching = false;
    }
  }
}
