import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/my_exceptions.dart';
import '../../../../core/use_case/use_case.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/use_cases/get_categories_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetCategoriesUseCase getCategories;
  HomeBloc({required this.getCategories}) : super(HomeLoading()) {
    on<HomeGetCategories>(_getCategories);
  }
  _getCategories(event, emit) async {
    emit(HomeLoading());
    final Either<MyException, List<CategoryEntity>> res = await getCategories.call(NoParams());
    res.fold(
      (MyException failure) => emit(const HomeError(errorMsg: 'GetCategoriesUseCase failed')),
      (List<CategoryEntity> categories) => emit(HomeSuccess(categories: categories)),
    );
  }
}
