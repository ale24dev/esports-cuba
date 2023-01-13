import 'package:esports_cuba/src/repositories/tournament_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:esports_cuba/src/shared/repository/ApiResult.dart';
import 'package:esports_cuba/src/repositories/game_database_repository.dart';
import 'package:esports_cuba/src/repositories/supabase_user_database_repository.dart';

final serviceLocator = GetIt.instance; // GetIt.I is also valid
void setUp() {
  Supabase supabase = Supabase.instance;
  serviceLocator.registerLazySingleton<SupabaseDatabaseRepository>(
      () => SupabaseDatabaseRepository(supabase));

  serviceLocator.registerLazySingleton<ApiResult>(() => ApiResult());
  serviceLocator.registerLazySingleton<GameDatabaseRepository>(
      () => GameDatabaseRepository(supabase));
  serviceLocator.registerLazySingleton<TournamentRepository>(
      () => TournamentRepository(supabase));
  // register more instances
}
