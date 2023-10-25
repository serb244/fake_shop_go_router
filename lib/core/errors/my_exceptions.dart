import 'package:equatable/equatable.dart';

abstract class MyException extends Equatable implements Exception {
  final List properties;
  const MyException({this.properties = const []});

  @override
  List<Object?> get props => properties;
}

class ServerException extends MyException {
  const ServerException();
}

class CacheException extends MyException {
  const CacheException();
}

class NoInternetConnectionException extends MyException {
  const NoInternetConnectionException();
}
