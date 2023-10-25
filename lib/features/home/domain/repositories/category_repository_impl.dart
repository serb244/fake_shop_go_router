import 'package:dartz/dartz.dart';
import 'package:fake_shop_go_router/features/home/domain/entities/category_entity.dart';

import '../../../../core/errors/my_exceptions.dart';

abstract class CategoryRepository {
  Future<Either<MyException, List<CategoryEntity>>> getCategories();
}
