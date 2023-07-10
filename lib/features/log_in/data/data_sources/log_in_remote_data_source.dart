import 'package:dio/dio.dart';
import 'package:first_assignment/core/api_constants/api_constants.dart';
import 'package:first_assignment/core/constants/constants.dart';
import 'package:first_assignment/core/error/exception.dart';
import 'package:first_assignment/features/log_in/data/models/user_model.dart';
import 'package:first_assignment/features/log_in/domain/entities/user_entity.dart';

abstract interface class LogInRemoteDataSource {
  Future<UserEntity> logIn({
    required String userName,
    required String password,
  });
}

class LogInRemoteDataSourceImpl implements LogInRemoteDataSource {
  LogInRemoteDataSourceImpl({required this.dio});

  final Dio dio;

  @override
  Future<UserEntity> logIn({
    required String userName,
    required String password,
  }) async {
    final Map<String, String> data = {
      'username': userName,
      'password': password,
    };

    final Response response = await dio.post(
      ApiConstants.logIn,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 600;
        },
      ),
      data: data,
    );
    print(response.data);
    if (response.statusCode == 200) {
      return UserModel.fromMap(response.data);
    } else {
      throw ServerException(
        errorMessage: response.data?['message'] ?? kDeafultErrorMessage,
      );
    }
  }
}
