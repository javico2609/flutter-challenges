import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:playground_flutter/constants/database.dart';
import 'package:sqflite/sqflite.dart';

class SqliteDatabaseService {
  Database db;

  Future<void> initDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'baseball_teams.db');

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE IF NOT EXISTS ${DatabaseContants.TEAMS_TABLE_NAME} (key INTEGER PRIMARY KEY, name TEXT, coach TEXT, players INTEGER)');
    });
  }

  Future<int> count({@required String tableName}) async {
    return Sqflite.firstIntValue(
        await db.rawQuery("SELECT COUNT(*) FROM $tableName"));
  }

  Future<Map> getById({@required String tableName, @required int id}) async {
    List<Map> result = await db.query(tableName, where: "id", whereArgs: [id]);
    return result.length > 0
        ? result.first
        : throw Exception("Element $id in $tableName not exist !!!");
  }

  Future<List<Map>> findAll({@required String tableName}) async {
    return await db.query(tableName);
  }

  Future<void> batch({@required Function(Batch) operations}) async {
    Batch batch = db.batch();
    operations(batch);
    await batch.commit(noResult: true);
  }

  Future<void> insertBatch({
    @required String tableName,
    @required List<Map<String, dynamic>> inserts,
  }) async {
    await batch(operations: (Batch batch) {
      inserts.forEach((mapValue) => batch.insert(tableName, mapValue));
    });
  }

  Future<int> update({
    @required String tableName,
    @required int id,
    @required Map<String, dynamic> model,
    String columnId = 'key',
  }) async {
    return await db
        .update(tableName, model, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> delete({
    @required String tableName,
    @required int id,
    String columnId = 'key',
  }) async {
    return await db.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> create({
    @required String tableName,
    @required Map<String, dynamic> item,
  }) async {
    return await db.insert(tableName, item);
  }
}
