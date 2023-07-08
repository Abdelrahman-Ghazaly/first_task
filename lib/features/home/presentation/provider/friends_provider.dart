import 'package:dartz/dartz.dart';
import 'package:first_assignment/core/error/failure.dart';
import 'package:first_assignment/core/use_cases/use_case.dart';
import 'package:first_assignment/features/home/domain/entities/friend_entity.dart';
import 'package:first_assignment/features/home/domain/use_cases/get_friends_use_case.dart';
import 'package:flutter/material.dart';

class FriendsProvider extends ChangeNotifier {
  FriendsProvider({required GetFriendsUseCase getFriendsUseCase})
      : _getFriendsUseCase = getFriendsUseCase;

  final GetFriendsUseCase _getFriendsUseCase;
  List<FriendEntity> _friendEntities = [];
  String _errorMessage = '';

  String get errorMessage => _errorMessage;
  List<FriendEntity> get friendEntities => _friendEntities;

  Future<void> getFriends() async {
    final Either<Failure, List<FriendEntity>> failureOrFriendEntity =
        await _getFriendsUseCase(NoParams());

    failureOrFriendEntity.fold(
      (faliure) => _errorMessage = faliure.message,
      (friendEntities) => _friendEntities = friendEntities,
    );
    notifyListeners();
  }
}
