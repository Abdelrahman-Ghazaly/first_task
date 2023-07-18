part of 'friend_cubit.dart';

abstract class FriendState extends Equatable {
  const FriendState();

  @override
  List<Object> get props => [];
}

class InitialState extends FriendState {
  const InitialState({required bool isLoading}) : _isLoading = isLoading;

  final bool _isLoading;

  bool get isLoading => _isLoading;

  @override
  List<Object> get props => [_isLoading];
}

class Success extends FriendState {
  const Success({
    required this.friendEntities,
  });

  final List<FriendEntity> friendEntities;

  @override
  List<Object> get props => [friendEntities];
}

class Error extends FriendState {
  const Error({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
