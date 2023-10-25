part of 'product_bloc.dart';

abstract class ProductsEvent extends Equatable {}

class GetProductsEvent extends ProductsEvent {
  @override
  List<Object?> get props => [];
}

class GetProductsByCategoryEvent extends ProductsEvent {
  final String categoryName;

  GetProductsByCategoryEvent(this.categoryName);

  @override
  List<Object?> get props => [categoryName];
}

class GetProductByIdEvent extends ProductsEvent {
  final int id;

  GetProductByIdEvent(this.id);

  @override
  List<Object?> get props => [id];
}
