import 'package:dartz/dartz.dart';
import 'package:first_assignment/core/error/failure.dart';
import 'package:first_assignment/features/log_in/domain/entities/user_entity.dart';
import 'package:first_assignment/features/log_in/domain/use_cases/log_in_use_case.dart';
import 'package:flutter/foundation.dart';

class LogInProvider with ChangeNotifier {
  LogInProvider({required LogInUseCase logInUseCase})
      : _logInUseCase = logInUseCase;

  final LogInUseCase _logInUseCase;
  UserEntity? _userEntity;
  String _errorMessage = '';

  UserEntity? get userEntity => _userEntity;
  String get errorMessage => _errorMessage;

  Future<void> logIn({
    required String userName,
    required String password,
  }) async {
    final Either<Failure, UserEntity> failureOrUserEntity = await _logInUseCase(
      Params(userName: userName, password: password),
    );

    failureOrUserEntity.fold(
      (faliure) => _errorMessage = faliure.message,
      (userEntity) => _userEntity = userEntity,
    );
    notifyListeners();
  }
}
