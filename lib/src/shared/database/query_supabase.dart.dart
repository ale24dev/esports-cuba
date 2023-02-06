///Clase para consultar las tablas de la Base de Datos
abstract class QuerySupabase {
  static String get bookmark => "id, news($news), xuser($xuser)";

  static String get favorites =>
      "id, xuser($xuser), Tournament($tournament), Player($player), Team($team)";

  static String get game => "id, name, image";

  static String get news => '''
          id, created_at, title, text, attachments,
          xuser($xuser)
          ''';

  static String get player => "id, nickname, name, image, country";

  static String get team =>
      "id, name, created_at, country, ceo, image_header, image_logo";

  static String get teamTournament =>
      "id, created_at, active, Team($team), Tournament($tournament)";

  static String get tournament =>
      '''id, name, created_at, edition, active, image_logo, image_header, description,
      TournamentType($tournamentType), TournamentState($tournamentState), Game($game), Winners($winners)''';

  static String get tournamentState => "id, state";

  static String get tournamentType => "id, name";

  static String get version =>
      "id, version, created_at, breacking_change, status, url, features";

  static String get winners => "id, first_place, second_place, third_place";

  static String get xuser => "id, username, image, email";
}
