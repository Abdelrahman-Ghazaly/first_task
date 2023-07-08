import 'package:dartz/dartz.dart';
import 'package:first_assignment/core/error/exception.dart';
import 'package:first_assignment/core/error/failure.dart';
import 'package:first_assignment/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:first_assignment/features/home/domain/entities/friend_entity.dart';
import 'package:first_assignment/features/home/domain/entities/sponser_entities.dart';
import 'package:first_assignment/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({required this.remoteDataSource});

  final HomeRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, List<FriendEntity>>> getFriends() async {
    try {
      final List<FriendEntity> result = await remoteDataSource.getFriends();
      return Right(result);
    } on ServerException catch (serverException) {
      return Left(ServerFailure(serverException.errorMessage));
    }
  }

  @override
  Future<Either<Failure, SponserEntity>> getSponsers() async {
    try {
      final SponserEntity result = await remoteDataSource.getSponer();
      return Right(result);
    } on ServerException catch (serverException) {
      return Left(ServerFailure(serverException.errorMessage));
    }
  }
}
