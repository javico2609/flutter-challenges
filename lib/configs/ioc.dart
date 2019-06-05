import 'package:get_it/get_it.dart';
import 'package:playground_flutter/services/firebase_basebal_team.service.dart';
import 'package:playground_flutter/services/sqlite_basebal_team.service.dart';
import 'package:playground_flutter/services/database.service.dart';
import 'package:playground_flutter/services/stack_overflow.service.dart';
import 'package:playground_flutter/services/web.client.dart';

final GetIt ioc = new GetIt();

class Ioc {
  static setupIocDependency() {
    ioc.registerSingleton<WebClient>(new WebClient());
    ioc.registerSingleton<StackOverflowService>(new StackOverflowService());
    ioc.registerSingleton<SqliteDatabaseService>(new SqliteDatabaseService());
    ioc.registerSingleton<SqliteBaseballService>(new SqliteBaseballService());
    ioc.registerSingleton<FirebaseBaseballService>(
        new FirebaseBaseballService());
  }

  static T get<T>() {
    return ioc<T>();
  }
}
