import 'package:first_assignment/caching/sql_database/database.dart';
import 'package:first_assignment/features/home/data/models/friend_model.dart';
import 'package:first_assignment/features/home/data/models/sponser_model.dart';
import 'package:sqflite/sqflite.dart' as sql;

import '../../domain/entities/friend_entity.dart';
import '../../domain/entities/sponser_entities.dart';

abstract class HomeLocalDataSource {
  Future<SponserEntity> getSponer();
  Future<List<FriendEntity>> getFriends();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  HomeLocalDataSourceImpl({required this.database});

  final Database database;

  Future<void> addSponser({required SponserModel sponserModel}) async {
    final db = await database.instance();

    final data = sponserModel.toMap();

    db.insert(
      'sopnesrs',
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
    // Todo: add table
  }

  Future<void> addFriend({required FriendModel friend}) async {
    final db = await database.instance();

    final data = friend.toMap();

    db.insert(
      'friends',
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
    // Todo: add table
  }

  @override
  Future<List<FriendEntity>> getFriends() {
    // TODO: implement getFriends
    throw UnimplementedError();
  }

  @override
  Future<SponserEntity> getSponer() {
    // TODO: implement getSponer
    throw UnimplementedError();
  }
}