import 'package:dartz/dartz.dart';
import 'package:first_assignment/core/error/failure.dart';
import 'package:first_assignment/core/use_cases/use_case.dart';
import 'package:first_assignment/features/home/domain/entities/friend_entity.dart';
import 'package:first_assignment/features/home/domain/repositories/home_repository.dart';

class GetFriendsUseCase implements UseCase<List<FriendEntity>, NoParams> {
  GetFriendsUseCase({required this.repository});

  final HomeRepository repository;

  @override
  Future<Either<Failure, List<FriendEntity>>> call(NoParams params) {
    return repository.getFriends();
  }
}
