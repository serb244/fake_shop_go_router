import 'package:dartz/dartz.dart';
import 'package:fake_shop_go_router/core/errors/my_exceptions.dart';
import 'package:fake_shop_go_router/features/product_list/domain/repositories/products_repository.dart';

import '../../../../core/use_case/use_case.dart';
import '../../../product_detail/domain/entities/product_entity.dart';

class GetProductByCategoryUseCase extends UseCase<List<ProductEntity>, String> {
  final ProductsRepository productRepository;

  GetProductByCategoryUseCase({required this.productRepository});

  @override
  Future<Either<MyException, List<ProductEntity>>> call(String params) async {
    return await productRepository.getProductsByCategory(params);
  }
}

// class ParamsCategory extends Equatable {
//   final String categoryName;
//   const ParamsCategory({required this.categoryName});
//
//   @override
//   List<Object?> get props => [categoryName];
// }
