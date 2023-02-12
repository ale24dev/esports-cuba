///Clase para consultar las tablas de la Base de Datos
abstract class QuerySupabase {
  static String get bookmark => "id, news($news), xuser($xuser)";

  static String get favorites =>
      "id, xuser($xuser), tournament($tournament), player($player), team($team)";

  static String get game => "id, name, image";

  static String get match =>
      "id, created_at, result_local, result_visitant, tournament($tournament), team_local($team), team_visitant($team), player_local($player), player_visitant($player), round($matchRound), state($matchState)";

  static String get matchRound => "id, round";

  static String get matchState => "id, state";

  static String get news => '''
          id, created_at, title, text, attachments,
          xuser($xuser)
          ''';

  static String get player => "id, nickname, name, image, country, popular";

  static String get team =>
      "id, name, created_at, country, ceo, image_header, image, popular";

  static String get teamTournament =>
      "id, created_at, active, team($team), tournament($tournament)";

  static String get tournament =>
      '''id, name, created_at, edition, active, image, image_header, quantity_groups, max_teams, prizepool, description, popular,individual, losser_bracket,
      tournamenttype($tournamentType), tournamentstate($tournamentState), game($game), winners($winners)''';

  static String get tournamentState => "id, state";

  static String get tournamentType => "id, name";

  static String get version =>
      "id, version, created_at, breacking_change, status, url, features";

  static String get winners => "id, first_place, second_place, third_place";

  static String get xuser => "id, username, image, email";
}
