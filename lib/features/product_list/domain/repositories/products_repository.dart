import 'package:dartz/dartz.dart';

import '../../../../core/errors/my_exceptions.dart';
import '../../../product_detail/domain/entities/product_entity.dart';

abstract class ProductsRepository {
  Future<Either<MyException, List<ProductEntity>>> getProducts();
  Future<Either<MyException, List<ProductEntity>>> getProductsByCategory(String category);
  Future<Either<MyException, ProductEntity>> getProductById(int id);
}
