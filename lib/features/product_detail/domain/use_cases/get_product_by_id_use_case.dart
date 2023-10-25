import 'package:dartz/dartz.dart';
import 'package:fake_shop_go_router/core/errors/my_exceptions.dart';
import 'package:fake_shop_go_router/features/product_list/domain/repositories/products_repository.dart';

import '../../../../core/use_case/use_case.dart';
import '../entities/product_entity.dart';

class GetProductByIdUseCase extends UseCase<ProductEntity, int> {
  final ProductsRepository productRepository;

  GetProductByIdUseCase({required this.productRepository});

  @override
  Future<Either<MyException, ProductEntity>> call(int params) async {
    return await productRepository.getProductById(params);
  }
}
//
// class ParamsId extends Equatable {
//   final int id;
//   const ParamsId({required this.id});
//
//   @override
//   List<Object?> get props => [id];
// }
