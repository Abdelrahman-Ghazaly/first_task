part of 'sponser_cubit.dart';

abstract class SponserState extends Equatable {
  const SponserState();

  @override
  List<Object> get props => [];
}

class Empty extends SponserState {}

class Loading extends SponserState {}

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
