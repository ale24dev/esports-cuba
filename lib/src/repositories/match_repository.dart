import 'package:esports_cuba/src/shared/database/query_supabase.dart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/match_base_model.dart';
import '../models/tournament_base_model.dart';
import '../shared/repository/ApiResult.dart';

class MatchRepository {
  final Supabase _supabase;
  late ApiResult apiResult;
  MatchRepository(this._supabase) {
    apiResult = ApiResult();
  }

  Future<ApiResult> getMatchsByTournament(
      TournamentBaseModel tournament) async {
    try {
      List<MatchBaseModel> listMatchs = [];
      final List<dynamic> response = await _supabase.client
          .from('match')
          .select(QuerySupabase.match)
          .eq("tournament", tournament.id)
          .order("created_at", ascending: true);
      for (var element in response) {
        MatchBaseModel matchBaseModel = MatchBaseModel.fromJson(element);
        listMatchs.add(matchBaseModel);
      }
      apiResult.responseObject = listMatchs;
      return apiResult;
    } catch (e) {
      print("Error: " + e.toString());
      apiResult.message = e.toString();
      apiResult.error = e.runtimeType;
      return apiResult;
    }
  }

  ///Obtener el historial de enfrentamientos
  Future<ApiResult> getHistoryLastMatchs(TournamentBaseModel tournament) async {
    try {
      List<MatchBaseModel> listMatchs = [];
      final List<dynamic> response = await _supabase.client
          .from('match')
          .select(QuerySupabase.match)
          .match({"tournament": tournament.id, "state": "finished"}).order(
              "created_at",
              ascending: true);
      for (var element in response) {
        MatchBaseModel matchBaseModel = MatchBaseModel.fromJson(element);
        listMatchs.add(matchBaseModel);
      }
      apiResult.responseObject = listMatchs;
      return apiResult;
    } catch (e) {
      print("Error: " + e.toString());
      apiResult.message = e.toString();
      apiResult.error = e.runtimeType;
      return apiResult;
    }
  }
}
