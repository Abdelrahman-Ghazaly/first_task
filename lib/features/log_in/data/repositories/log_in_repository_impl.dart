import 'package:dartz/dartz.dart';
import 'package:first_assignment/core/error/exception.dart';
import 'package:first_assignment/core/error/failure.dart';
import 'package:first_assignment/features/log_in/data/data_sources/log_in_remote_data_source.dart';
import 'package:first_assignment/features/log_in/domain/entities/user_entity.dart';
import 'package:first_assignment/features/log_in/domain/repositories/log_in_repository.dart';

class LogInRepositoryImpl implements LogInRepository {
  LogInRepositoryImpl({required this.remoteDataSource});

  final LogInRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, UserEntity>> logIn({
    required String userName,
    required String password,
  }) async {
    try {
      final UserEntity result = await remoteDataSource.logIn(
        userName: userName,
        password: password,
      );
      return Right(result);
    } on ServerException catch (serverException) {
      return Left(ServerFailure(serverException.errorMessage));
    }
  }
}
