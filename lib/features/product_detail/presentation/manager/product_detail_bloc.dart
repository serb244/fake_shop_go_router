import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/my_exceptions.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/use_cases/get_product_by_id_use_case.dart';

part 'product_detail_event.dart';

part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final GetProductByIdUseCase getProductById;

  ProductDetailBloc({required this.getProductById}) : super(ProductDetailLoadingState()) {
    on<ProductDetailGetByIdEvent>(_getProductById);
  }

  _getProductById(ProductDetailGetByIdEvent event, Emitter<ProductDetailState> emit) async {
    emit(ProductDetailLoadingState());
    final Either<MyException, ProductEntity> result = await getProductById(event.id);
    result.fold(
        (l) => emit(const ProductDetailFailureState(errorMsg: 'ProductDetailGetByIdEvent Error')),
        (r) => emit(ProductDetailLoadedState(product: r)));
  }
}
