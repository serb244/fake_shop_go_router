import 'package:equatable/equatable.dart';

import '../../data/models/category_model.dart';

class CategoryEntity extends Equatable {
  final String name;

  const CategoryEntity({
    required this.name,
  });
  @override
  List<Object?> get props => [name];
  factory CategoryEntity.fromModel(CategoryModel model) {
    return CategoryEntity(
      name: model.name,
    );
  }
}
