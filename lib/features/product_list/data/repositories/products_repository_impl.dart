import 'package:dartz/dartz.dart';
import 'package:fake_shop_go_router/features/product_list/data/models/product_model.dart';
import 'package:fake_shop_go_router/features/product_detail/domain/entities/product_entity.dart';

import '../../../../core/errors/my_exceptions.dart';
import '../../../../core/utils/network_info.dart';
import '../../domain/repositories/products_repository.dart';
import '../data_sources/products_remote_data_source.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final ProductsRemoteDataSource productRemoteDataSource;
  final NetworkInfo networkInfo;

  ProductsRepositoryImpl({
    required this.productRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<MyException, List<ProductEntity>>> getProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final List<ProductModel> productModels = await productRemoteDataSource.getProducts();
        final List<ProductEntity> productEntities =
            productModels.map((productModel) => ProductEntity.fromModel(productModel)).toList();
        return right(productEntities);
      } on ServerException {
        return left(const ServerException());
      }
    } else {
      return left(const NoInternetConnectionException());
    }
  }

  @override
  Future<Either<MyException, ProductEntity>> getProductById(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final ProductModel productModel = await productRemoteDataSource.getProductById(id);
        final ProductEntity productEntity = ProductEntity.fromModel(productModel);
        return right(productEntity);
      } on ServerException {
        return left(const ServerException());
      }
    } else {
      return left(const NoInternetConnectionException());
    }
  }

  @override
  Future<Either<MyException, List<ProductEntity>>> getProductsByCategory(String category) async {
    if (await networkInfo.isConnected) {
      try {
        final List<ProductModel> productModels =
            await productRemoteDataSource.getProductsByCategory(category);
        final List<ProductEntity> productEntities =
            productModels.map((productModel) => ProductEntity.fromModel(productModel)).toList();
        return right(productEntities);
      } on ServerException {
        return left(const ServerException());
      }
    } else {
      return left(const NoInternetConnectionException());
    }
  }
}
