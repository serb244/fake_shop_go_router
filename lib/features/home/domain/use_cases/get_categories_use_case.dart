import 'package:dartz/dartz.dart';
import 'package:fake_shop_go_router/core/errors/my_exceptions.dart';

import '../../../../core/use_case/use_case.dart';
import '../entities/category_entity.dart';
import '../repositories/category_repository_impl.dart';

class GetCategoriesUseCase extends UseCase<List<CategoryEntity>, NoParams> {
  final CategoryRepository categoryRepository;

  GetCategoriesUseCase({required this.categoryRepository});

  @override
  Future<Either<MyException, List<CategoryEntity>>> call(NoParams params) async {
    return await categoryRepository.getCategories();
  }
}
