import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fake_shop_go_router/core/errors/my_exceptions.dart';
import 'package:fake_shop_go_router/features/product_detail/domain/entities/product_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/use_case/use_case.dart';
import '../../../home/domain/use_cases/use_cases.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProductByIdUseCase getProductById;
  final GetProductByCategoryUseCase getProductsByCategory;
  final GetProductsUseCase getProducts;
  ProductsBloc({
    required this.getProductById,
    required this.getProductsByCategory,
    required this.getProducts,
  }) : super(ProductLoadingState()) {
    on<GetProductsEvent>(_getProducts);
    on<GetProductsByCategoryEvent>(_getProductsByCategory);
  }
  _getProductsByCategory(GetProductsByCategoryEvent event, Emitter<ProductsState> emit) async {
    emit(ProductLoadingState());
    final Either<MyException, List<ProductEntity>> result =
        await getProductsByCategory(event.categoryName);

    result.fold(
      (MyException failure) => emit(
        ProductFailure(errorMsg: getStringByFailure(failure)),
      ),
      (List<ProductEntity> products) {
        // TODO productStorageRepository
        emit(ProductsLoadedState(products: products));
      },
    );
  }

  _getProducts(ProductsEvent event, Emitter<ProductsState> emit) async {
    emit(ProductLoadingState());
    final Either<MyException, List<ProductEntity>> result = await getProducts(NoParams());

    result.fold(
      (MyException failure) => emit(
        ProductFailure(errorMsg: getStringByFailure(failure)),
      ),
      (List<ProductEntity> products) {
        // TODO productStorageRepository
        emit(ProductsLoadedState(products: products));
      },
    );
  }

  String getStringByFailure(MyException myException) {
    if (myException is ServerException) {
      return "Server failure";
    } else if (myException is NoInternetConnectionException) {
      return "No Internet Connection!!!";
    } else {
      return "Unexpected Error";
    }
  }
}
