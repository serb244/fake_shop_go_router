part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeError extends HomeState {
  final String errorMsg;
  @override
  List<Object?> get props => [errorMsg];

  const HomeError({
    required this.errorMsg,
  });
}

class HomeSuccess extends HomeState {
  final List<CategoryEntity> categories;
  @override
  List<Object?> get props => [categories];

  const HomeSuccess({
    required this.categories,
  });
}
