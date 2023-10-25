import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;

  const ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, price, description, category, image];

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      title: json["title"],
      price: json["price"],
      description: json["description"],
      category: json["category"],
      image: json["image"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "price": price,
      "description": description,
      "category": category,
      "image": image,
    };
  }
//
// factory ProductModel.fromJson(Map<String, dynamic> json) {
//   return ProductModel(
//     id: json['id'] as int,
//     title: json['title'] as String,
//     price: json['price'] as double,
//     description: json['description'] as String,
//     category: json['category'] as String,
//     image: json['image'] as String,
//   );
// }
}
