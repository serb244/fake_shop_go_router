import 'package:dartz/dartz.dart';

import '../../../../core/errors/my_exceptions.dart';
import '../../../../core/utils/network_info.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/repositories/category_repository_impl.dart';
import '../data_sources/data_sources.dart';
import '../models/category_model.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryRemoteDataSource categoryRemoteDataSource;
  final NetworkInfo networkInfo;

  CategoryRepositoryImpl({
    required this.categoryRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<MyException, List<CategoryEntity>>> getCategories() async {
    if (await networkInfo.isConnected) {
      try {
        final List<CategoryModel> categoryModels = await categoryRemoteDataSource.getCategories();
        final List<CategoryEntity> categoryEntities =
            categoryModels.map((categoryModel) => CategoryEntity.fromModel(categoryModel)).toList();
        return right(categoryEntities);
      } on ServerException {
        return left(const ServerException());
      }
    } else {
      return left(const NoInternetConnectionException());
    }
  }
}
