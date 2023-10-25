import 'package:dartz/dartz.dart';

import '../../../../core/errors/my_exceptions.dart';
import '../../../product_detail/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<MyException, ProductEntity>> getProductById(int id);
}
