import 'package:sqflite/sqflite.dart' as sql;

class Database {
  _createTables(sql.Database database) async {
    await database.execute('sql');
    // Todo: write sql
  }

  Future<sql.Database> instance() async {
    return sql.openDatabase(
      'cached_data.db',
      onCreate: (db, _) async {
        await _createTables(db);
      },
    );
  }
}
