import 'package:dartz/dartz.dart';
import 'package:first_assignment/core/error/failure.dart';
import 'package:first_assignment/features/log_in/domain/entities/user_entity.dart';

abstract interface class LogInRepository {
  Future<Either<Failure, UserEntity>> logIn({
    required String userName,
    required String password,
  });
}
