part of 'sponser_cubit.dart';

abstract class SponserState extends Equatable {
  const SponserState();

  @override
  List<Object> get props => [];
}

class InitialState extends SponserState {
  const InitialState({required bool isLoading}) : _isLoading = isLoading;

  final bool _isLoading;

  bool get isLoading => _isLoading;

  @override
  List<Object> get props => [_isLoading];
}

class Success extends SponserState {
  const Success({
    required this.sponserEntity,
  });

  final SponserEntity sponserEntity;

  @override
  List<Object> get props => [sponserEntity];
}

class Error extends SponserState {
  const Error({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
