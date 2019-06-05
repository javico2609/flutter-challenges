import 'package:playground_flutter/configs/ioc.dart';
import 'package:playground_flutter/constants/database.dart';
import 'package:playground_flutter/models/baseball.model.dart';
import 'package:playground_flutter/services/database.service.dart';

class SqliteBaseballService {
  SqliteDatabaseService _database;

  SqliteBaseballService([SqliteDatabaseService db])
      : _database = db ?? ioc<SqliteDatabaseService>();

  Stream<List<BaseballModel>> list() => Stream.fromFuture(
          _database.findAll(tableName: DatabaseContants.TEAMS_TABLE_NAME))
      .map(
        (List<Map> list) => list.map((m) => BaseballModel.fromJson(m)).toList(),
      )
      .take(1);

  Future<void> seedData() async {
    int count =
        await _database.count(tableName: DatabaseContants.TEAMS_TABLE_NAME);

    if (count == 0) {
      await _database.insertBatch(
        tableName: DatabaseContants.TEAMS_TABLE_NAME,
        inserts: [
          {
            'name': 'NY Mets',
            'coach': 'Javier',
            'players': 60,
          },
          {
            'name': 'WhiteSox',
            'coach': 'Javier1',
            'players': 75,
          },
          {
            'name': 'Cardinals',
            'coach': 'Javier2',
            'players': 45,
          }
        ],
      );
    }
  }

  Future<void> delete(BaseballModel item) async {
    await _database.delete(
      tableName: DatabaseContants.TEAMS_TABLE_NAME,
      id: item.key,
    );
  }

  Future<void> create(BaseballModel item) async {
    await _database.create(
      tableName: DatabaseContants.TEAMS_TABLE_NAME,
      item: item.toJson(),
    );
  }

  Future<void> update(BaseballModel item) async {
    await _database.update(
      tableName: DatabaseContants.TEAMS_TABLE_NAME,
      model: item.toJson(),
      id: item.key,
    );
  }
}
