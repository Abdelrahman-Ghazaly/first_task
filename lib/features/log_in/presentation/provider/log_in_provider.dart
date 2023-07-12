import 'package:first_assignment/features/home/presentation/screens/home_screen.dart';
import 'package:first_assignment/features/log_in/domain/entities/user_entity.dart';
import 'package:first_assignment/features/log_in/domain/use_cases/log_in_use_case.dart';
import 'package:flutter/material.dart';

class LogInProvider extends ChangeNotifier {
  LogInProvider({required LogInUseCase logInUseCase})
      : _logInUseCase = logInUseCase;

  final LogInUseCase _logInUseCase;
  UserEntity? _userEntity;
  String _message = '';

  UserEntity? get userEntity => _userEntity;
  String get message => _message;

  Future<dynamic> logIn(
    BuildContext context, {
    required String userName,
    required String password,
  }) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );

    // final failureOrUserEntity = await _logInUseCase(
    //   Params(userName: userName, password: password),
    // );

    // failureOrUserEntity.fold(
    //   (faliure) => _message = faliure.message,
    //   (userEntity) {
    //     _userEntity = userEntity;
    //     _message = 'Logged in successfully';
    //   },
    // );
    // notifyListeners();
  }
}
