import 'package:sqflite/sqflite.dart' as sql;

class DatabaseHelper {
  _createTables(sql.Database database) async {
    await database.execute('''
    CREATE TABLE sponsers 
      (id INTEGER PRIMARY KEY,
      icon TEXT,
      image TEXT,
      title TEXT,
      description TEXT,
      promo TEXT)
     ''');
    await database.execute('''
    CREATE TABLE friends 
      (id INTEGER PRIMARY KEY,
      name TEXT,
      image TEXT,
      lastMessage TEXT,
      lastMessageTime TEXT,
      isOnline INTEGER)
''');
  }

  Future<sql.Database> instance() async {
    return sql.openDatabase(
      'cached_data.db',
      version: 1,
      onCreate: (db, _) async {
        await _createTables(db);
      },
    );
  }
}
