import 'package:get_it/get_it.dart';
import 'package:playground_flutter/services/baseball-team.service.dart';
import 'package:playground_flutter/services/database.service.dart';
import 'package:playground_flutter/services/stack_overflow.service.dart';
import 'package:playground_flutter/services/web.client.dart';

final GetIt ioc = new GetIt();

class Ioc {
  static setupIocDependency() {
    ioc.registerSingleton<WebClient>(new WebClient());
    ioc.registerSingleton<StackOverflowService>(new StackOverflowService());
    ioc.registerSingleton<SqliteDatabaseService>(new SqliteDatabaseService());
    ioc.registerSingleton<BaseballService>(new BaseballService());
  }

  static T get<T>() {
    return ioc<T>();
  }
}
