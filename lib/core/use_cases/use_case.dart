import 'package:dartz/dartz.dart';

import 'package:first_assignment/core/error/failure.dart';

abstract interface class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

class NoParams {}
