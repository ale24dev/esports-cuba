import 'package:esports_cuba/src/repositories/auth_repository.dart';
import 'package:esports_cuba/src/repositories/favorites_repository.dart';
import 'package:esports_cuba/src/repositories/news_repository.dart';
import 'package:esports_cuba/src/repositories/team_tournament_repository.dart';
import 'package:esports_cuba/src/repositories/tournament_repository.dart';
import 'package:esports_cuba/src/repositories/user_repository.dart';
import 'package:esports_cuba/src/repositories/version_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:esports_cuba/src/shared/repository/ApiResult.dart';
import 'package:esports_cuba/src/repositories/game_database_repository.dart';
import 'package:esports_cuba/src/repositories/supabase_user_database_repository.dart';

final serviceLocator = GetIt.instance; // GetIt.I is also valid
void setUp() async {
  Supabase supabase = Supabase.instance;
  serviceLocator.registerLazySingleton<SupabaseDatabaseRepository>(
      () => SupabaseDatabaseRepository(supabase));

  serviceLocator.registerLazySingleton<ApiResult>(() => ApiResult());

  serviceLocator.registerLazySingleton<GameDatabaseRepository>(
      () => GameDatabaseRepository(supabase));

  serviceLocator.registerLazySingleton<TournamentRepository>(
      () => TournamentRepository(supabase));

  serviceLocator
      .registerLazySingleton<NewsRepository>(() => NewsRepository(supabase));

  serviceLocator.registerLazySingleton<BookmarkRepository>(
      () => BookmarkRepository(supabase));

  serviceLocator
      .registerLazySingleton<AuthRepository>(() => AuthRepository(supabase));

  serviceLocator.registerLazySingleton<VersionRepository>(
      () => VersionRepository(supabase));
  serviceLocator
      .registerLazySingleton<UserRepository>(() => UserRepository(supabase));
  serviceLocator
      .registerLazySingleton<TeamTournamentRepository>(() => TeamTournamentRepository(supabase));
}
