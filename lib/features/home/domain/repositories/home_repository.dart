import 'package:dartz/dartz.dart';
import 'package:first_assignment/core/error/failure.dart';
import 'package:first_assignment/features/home/domain/entities/friend_entity.dart';
import 'package:first_assignment/features/home/domain/entities/sponser_entities.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, SponserEntity>> getSponsers();
  Future<Either<Failure, List<FriendEntity>>> getFriends();
}
