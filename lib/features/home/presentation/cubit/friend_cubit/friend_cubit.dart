import 'package:dartz/dartz.dart';
import 'package:first_assignment/core/error/failure.dart';
import 'package:first_assignment/core/use_cases/use_case.dart';
import 'package:first_assignment/features/home/domain/use_cases/get_friends_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_assignment/features/home/domain/entities/friend_entity.dart';

part 'friend_state.dart';

class FriendCubit extends Cubit<FriendState> {
  FriendCubit({
    required GetFriendsUseCase getFriendsUseCase,
  })  : _getFriendsUseCase = getFriendsUseCase,
        super(const InitialState(isLoading: false));

  final GetFriendsUseCase _getFriendsUseCase;

  getFriends() async {
    emit(const InitialState(isLoading: true));
    final failureOrSuccess = await _getFriendsUseCase(NoParams());
    emit(await _failureOrSuccess(failureOrSuccess));
  }
}

Future<FriendState> _failureOrSuccess(
    Either<Failure, List<FriendEntity>> failureOrSuccess) async {
  return failureOrSuccess.fold(
    (failure) => Error(message: failure.message),
    (friendEntity) => Success(friendEntities: friendEntity),
  );
}
