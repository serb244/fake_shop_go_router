import 'package:dartz/dartz.dart';
import 'package:fake_shop_go_router/core/errors/my_exceptions.dart';

import '../../../../core/use_case/use_case.dart';
import '../../../product_detail/domain/entities/product_entity.dart';
import '../repositories/products_repository.dart';

class GetProductsUseCase extends UseCase<List<ProductEntity>, NoParams> {
  final ProductsRepository productRepository;

  GetProductsUseCase({required this.productRepository});

  @override
  Future<Either<MyException, List<ProductEntity>>> call(NoParams params) async {
    return await productRepository.getProducts();
  }
}
