part of 'friend_cubit.dart';

abstract class FriendState extends Equatable {
  const FriendState();

  @override
  List<Object> get props => [];
}

class Empty extends FriendState {}

class Loading extends FriendState {}

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
