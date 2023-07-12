import 'package:dartz/dartz.dart';
import 'package:first_assignment/core/error/exception.dart';
import 'package:first_assignment/core/error/failure.dart';
import 'package:first_assignment/core/network/network_info.dart';
import 'package:first_assignment/features/home/data/data_sources/home_local_data_source.dart';
import 'package:first_assignment/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:first_assignment/features/home/domain/entities/friend_entity.dart';
import 'package:first_assignment/features/home/domain/entities/sponser_entities.dart';
import 'package:first_assignment/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, List<FriendEntity>>> getFriends() async {
    try {
      late List<FriendEntity> result;

      if (await networkInfo.isConnected) {
        result = await remoteDataSource.getFriends();
      } else {
        result = await localDataSource.getFriends();
      }
      return Right(result);
    } on ServerException catch (serverException) {
      return Left(ServerFailure(serverException.errorMessage));
    }
  }

  @override
  Future<Either<Failure, SponserEntity>> getSponsers() async {
    try {
      late SponserEntity result;

      if (await networkInfo.isConnected) {
        result = await remoteDataSource.getSponer();
      } else {
        result = await localDataSource.getSponer();
      }
      return Right(result);
    } on ServerException catch (serverException) {
      return Left(ServerFailure(serverException.errorMessage));
    }
  }
}
