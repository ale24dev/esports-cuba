import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/match_base_model.dart';
import '../shared/repository/ApiResult.dart';
import '../shared/database/query_supabase.dart.dart';
import 'package:esports_cuba/src/models/roster_base_model.dart';

class RosterRepository {
  final Supabase _supabase;
  late ApiResult apiResult;
  RosterRepository(this._supabase) {
    apiResult = ApiResult();
  }

  Future<ApiResult> getRostersByMatch(MatchBaseModel match) async {
    try {
      List<List<RosterBaseModel>> listRosters = [];

      List<RosterBaseModel> roster = [];

      ///Buscampos el equipo local de la BD
      List<dynamic> response = await _supabase.client
          .from('roster')
          .select(QuerySupabase.roster)
          .match(
              {"tournament": match.tournament.id, "team": match.teamLocal!.id});
      print(response);
      for (var element in response) {
        RosterBaseModel teamBaseModel = RosterBaseModel.fromJson(element);
        roster.add(teamBaseModel);
      }
      listRosters.add(roster);

      ///Buscampos el equipo visitante de la BD
      ///Limpiamos el roster para ñadir el del equipo visitante
      roster = [];
      response = await _supabase.client
          .from('roster')
          .select(QuerySupabase.roster)
          .match({
        "tournament": match.tournament.id,
        "team": match.teamVisitant!.id
      });
      print(response);
      for (var element in response) {
        RosterBaseModel teamBaseModel = RosterBaseModel.fromJson(element);
        roster.add(teamBaseModel);
      }

      listRosters.add(roster);

      apiResult.responseObject = listRosters;
      return apiResult;
    } catch (e) {
      print(e);
      apiResult.message = e.toString();
      apiResult.error = e.runtimeType;
      return apiResult;
    }
  }
}
