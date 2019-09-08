import 'package:get_it/get_it.dart';
import 'package:playground_flutter/services/firebase_basebal_team.service.dart';
import 'package:playground_flutter/services/sqlite_basebal_team.service.dart';
import 'package:playground_flutter/services/database.service.dart';
import 'package:playground_flutter/services/stack_overflow.service.dart';
import 'package:playground_flutter/services/web.client.dart';
import 'package:playground_flutter/shared/utils/touchid.util.dart';

final GetIt ioc = GetIt.instance;

class Ioc {
  static setupIocDependency() {
    ioc.registerSingleton<WebClient>(new WebClient());
    ioc.registerSingleton<StackOverflowService>(new StackOverflowService());
    ioc.registerSingleton<SqliteDatabaseService>(new SqliteDatabaseService());
    ioc.registerSingleton<SqliteBaseballService>(new SqliteBaseballService());
    ioc.registerSingleton<FirebaseBaseballService>(new FirebaseBaseballService());
    ioc.registerSingleton<TouchIdUtil>(new TouchIdUtil());
  }

  static T get<T>() {
    return ioc.get<T>();
  }
}
