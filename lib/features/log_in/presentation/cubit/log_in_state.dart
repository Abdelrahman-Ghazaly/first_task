part of 'log_in_cubit.dart';

abstract class LogInState extends Equatable {
  const LogInState();

  @override
  List<Object> get props => [];
}

class Empty extends LogInState {}

class Loading extends LogInState {}

class Success extends LogInState {
  const Success({
    required this.message,
    required this.userEntity,
  });

  final String message;
  final UserEntity userEntity;

  @override
  List<Object> get props => [message];
}

class Error extends LogInState {
  const Error({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
