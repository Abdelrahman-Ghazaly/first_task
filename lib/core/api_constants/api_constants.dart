
import 'dart:io';

const String _baseUrl = 'https://dummyjson.com/';

class ApiConstants {
  static const String logIn = '${_baseUrl}auth/login';

  static final String friends = '${_baseDummyJsonUrl}dummy_friends_data.json';
  static final String sponser = '${_baseDummyJsonUrl}dummy_sponser_data.json';
}

final String _baseDummyJsonUrl =   'http://${Platform.isIOS ? '127.0.0.1':'10.0.2.2'}:5500/'  ;
