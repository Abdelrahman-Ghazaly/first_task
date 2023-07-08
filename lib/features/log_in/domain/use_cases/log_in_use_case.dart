import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:first_assignment/core/error/failure.dart';
import 'package:first_assignment/core/use_cases/use_case.dart';
import 'package:first_assignment/features/log_in/domain/entities/user_entity.dart';
import 'package:first_assignment/features/log_in/domain/repositories/log_in_repository.dart';

class LogInUseCase implements UseCase<UserEntity, Params> {
  const LogInUseCase({required this.repository});

  final LogInRepository repository;

  @override
  Future<Either<Failure, UserEntity>> call(Params params) {
    return repository.logIn(
      userName: params.userName,
      password: params.password,
    );
  }
}

class Params extends Equatable {
  const Params({
    required this.userName,
    required this.password,
  });

  final String userName;
  final String password;

  @override
  List<Object?> get props => [userName, password];
}
