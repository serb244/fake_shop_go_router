import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fake_shop_go_router/core/errors/my_exceptions.dart';

abstract class UseCase<Type, Params> {
  Future<Either<MyException, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
