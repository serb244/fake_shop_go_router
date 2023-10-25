// part of 'product_bloc.dart';
//
// abstract class ProductState extends Equatable {}
//
// class ProductsLoadedState extends ProductState {
//   final List<ProductEntity> products;
//   ProductsLoadedState({
//     required this.products,
//   });
//   @override
//   List<Object?> get props => [products];
// }
//
// class ProductLoadingState extends ProductState {
//   @override
//   List<Object?> get props => [];
// }
//
// class ProductLoadingFailure extends ProductState {
//   final String errorMsg;
//   ProductLoadingFailure({required this.errorMsg});
//   @override
//   List<Object?> get props => [errorMsg];
// }
//
// class ProductDetailsLoadedState extends ProductState {
//   final ProductEntity product;
//
//   ProductDetailsLoadedState({required this.product});
//   @override
//   List<Object?> get props => [product];
// }
