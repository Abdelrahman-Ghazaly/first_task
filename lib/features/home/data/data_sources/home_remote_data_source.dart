import 'package:dio/dio.dart';
import 'package:first_assignment/core/api_constants/api_constants.dart';
import 'package:first_assignment/core/constants/constants.dart';
import 'package:first_assignment/core/error/exception.dart';
import 'package:first_assignment/features/home/data/data_sources/home_local_data_source.dart';
import 'package:first_assignment/features/home/data/models/friend_model.dart';
import 'package:first_assignment/features/home/data/models/sponser_model.dart';
import 'package:first_assignment/features/home/domain/entities/friend_entity.dart';
import 'package:first_assignment/features/home/domain/entities/sponser_entities.dart';

abstract interface class HomeRemoteDataSource {
  Future<SponserEntity> getSponer();
  Future<List<FriendEntity>> getFriends();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  HomeRemoteDataSourceImpl({required this.dio, required this.localDataSource});

  final Dio dio;
  final HomeLocalDataSource localDataSource;

  @override
  Future<List<FriendEntity>> getFriends() async {
    final Response response = await dio.get(ApiConstants.friends);

    if (response.statusCode == 200) {
      final List<FriendModel> friendModelList = List.from(
        response.data['friends'].map(
          (element) => FriendModel.fromMap(element),
        ),
      );
      for (var friendModel in friendModelList) {
        await localDataSource.addFriend(friendModel: friendModel);
      }
      return friendModelList;
    } else {
      throw ServerException(
        errorMessage:
            response.data?['message'] as String? ?? kDeafultErrorMessage,
      );
    }
  }

  @override
  Future<SponserEntity> getSponer() async {
    final Response response = await dio.get(ApiConstants.sponser);

    if (response.statusCode == 200) {
      final SponserModel sponserModel = SponserModel.fromMap(response.data);
      await localDataSource.addSponser(sponserModel: sponserModel);

      return sponserModel;
    } else {
      throw ServerException(
        errorMessage: response.data?['message'] ?? kDeafultErrorMessage,
      );
    }
  }
}
