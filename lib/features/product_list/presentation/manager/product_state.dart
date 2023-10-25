part of 'product_bloc.dart';

abstract class ProductsState extends Equatable {}

class ProductsLoadedState extends ProductsState {
  final List<ProductEntity> products;
  ProductsLoadedState({
    required this.products,
  });
  @override
  List<Object?> get props => [products];
}

class ProductLoadingState extends ProductsState {
  @override
  List<Object?> get props => [];
}

class ProductFailure extends ProductsState {
  final String errorMsg;
  ProductFailure({required this.errorMsg});
  @override
  List<Object?> get props => [errorMsg];
}

class ProductDetailsLoadedState extends ProductsState {
  final ProductEntity product;

  ProductDetailsLoadedState({required this.product});
  @override
  List<Object?> get props => [product];
}
