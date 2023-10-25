part of 'product_detail_bloc.dart';

abstract class ProductDetailState extends Equatable {
  const ProductDetailState();
}

class ProductDetailLoadingState extends ProductDetailState {
  @override
  List<Object?> get props => [];
}

class ProductDetailLoadedState extends ProductDetailState {
  final ProductEntity product;

  const ProductDetailLoadedState({required this.product});
  @override
  List<Object?> get props => [product];
}

class ProductDetailFailureState extends ProductDetailState {
  final String errorMsg;

  const ProductDetailFailureState({required this.errorMsg});
  @override
  List<Object?> get props => [errorMsg];
}
