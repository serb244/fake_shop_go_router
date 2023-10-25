import 'package:equatable/equatable.dart';

import '../../../product_list/data/models/product_model.dart';
import '../../../home/domain/entities/category_entity.dart';

class ProductEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final double price;
  final String image;
  final CategoryEntity category;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.category,
  });

  @override
  List<Object?> get props => [id, name, description, price, image, category];
  factory ProductEntity.fromModel(ProductModel model) {
    return ProductEntity(
      id: model.id,
      name: model.title,
      description: model.description,
      price: model.price,
      image: model.image,
      category: CategoryEntity(
        name: model.category,
      ),
    );
  }
}
