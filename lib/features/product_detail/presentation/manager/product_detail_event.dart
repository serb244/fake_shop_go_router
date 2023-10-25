part of 'product_detail_bloc.dart';

abstract class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();
}

class ProductDetailGetByIdEvent extends ProductDetailEvent {
  final int id;

  @override
  List<Object?> get props => [id];

  const ProductDetailGetByIdEvent({
    required this.id,
  });
}
