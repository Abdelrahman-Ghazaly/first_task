import 'package:dartz/dartz.dart';
import 'package:first_assignment/core/error/failure.dart';
import 'package:first_assignment/features/log_in/domain/entities/user_entity.dart';
import 'package:first_assignment/features/log_in/domain/use_cases/log_in_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit({required LogInUseCase logInUseCase})
      : _logInUseCase = logInUseCase,
        super(Empty());

  final LogInUseCase _logInUseCase;

  logIn({required String userName, required String password}) async {
    emit(Loading());

    final Either<Failure, UserEntity> failureOrSuccess =
        await _logInUseCase(Params(
      userName: userName,
      password: password,
    ));

    emit(await _failureOrSuccess(failureOrSuccess));
  }
}

Future<LogInState> _failureOrSuccess(
  Either<Failure, UserEntity> failureOrSuccess,
) async {
  return await failureOrSuccess.fold(
    (failure) => Error(message: failure.message),
    (userEntity) => Success(
      message: 'Logged in Successfully',
      userEntity: userEntity,
    ),
  );
}
