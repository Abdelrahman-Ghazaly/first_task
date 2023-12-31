import 'package:first_assignment/caching/sql_database/database_helper.dart';
import 'package:first_assignment/features/home/data/models/friend_model.dart';
import 'package:first_assignment/features/home/data/models/sponser_model.dart';
import 'package:sqflite/sqflite.dart' as sql;

import '../../domain/entities/friend_entity.dart';
import '../../domain/entities/sponser_entities.dart';

abstract class HomeLocalDataSource {
  Future<SponserEntity> getSponer();
  Future<List<FriendEntity>> getFriends();

  Future<void> addFriend({required FriendModel friendModel});
  Future<void> addSponser({required SponserModel sponserModel});
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  HomeLocalDataSourceImpl({required this.database});

  final DatabaseHelper database;

  @override
  Future<void> addSponser({required SponserModel sponserModel}) async {
    final db = await database.instance();

    final data = sponserModel.toMap();

    await db.insert(
      'sponsers',
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> addFriend({required FriendModel friendModel}) async {
    final db = await database.instance();

    final data = friendModel.toMap();

    data['isOnline'] = data['isOnline'] ? 1 : 0;

    await db.insert(
      'friends',
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<FriendEntity>> getFriends() async {
    final db = await database.instance();

    final List<Map<String, dynamic>> response = await db.query('friends');

    final List<FriendModel> friendModelList = List.from(
      response.map(
        (element) => FriendModel.fromMap(element),
      ),
    );

    return friendModelList;
  }

  @override
  Future<SponserEntity> getSponer() async {
    final db = await database.instance();

    final List<Map<String, dynamic>> response = await db.query('sponsers');

    final List<SponserModel> sponserModelList = List.from(
      response.map(
        (element) => SponserModel.fromMap(element),
      ),
    );

    return sponserModelList[0];
  }
}
