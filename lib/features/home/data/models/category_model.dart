import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final String name;

  const CategoryModel({required this.name});

  @override
  List<Object?> get props => [name];

  factory CategoryModel.fromJApi(String name) {
    return CategoryModel(name: name);
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json["name"],
    );
  }
//
}
