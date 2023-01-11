import 'package:esports_cuba/repositories/game_database_repository.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'repositories/supabase_user_database_repository.dart';

final serviceLocator = GetIt.instance; // GetIt.I is also valid
void setUp() {
  serviceLocator.registerLazySingleton<SupabaseDatabaseRepository>(
      () => SupabaseDatabaseRepository(Supabase.instance));

  serviceLocator.registerLazySingleton<ApiResult>(() => ApiResult());
  serviceLocator.registerLazySingleton<GameDatabaseRepository>(
      () => GameDatabaseRepository(Supabase.instance));
  // register more instances
}
