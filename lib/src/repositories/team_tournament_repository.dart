import 'package:esports_cuba/src/models/tournament_base_model.dart';
import 'package:esports_cuba/src/shared/database/query_supabase.dart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';

import '../models/team_tournament_base_model.dart';

class TeamTournamentRepository {
  final Supabase _supabase;
  late ApiResult apiResult;
  TeamTournamentRepository(this._supabase) {
    apiResult = ApiResult();
  }

  Future<ApiResult> getTeamsByTournament(TournamentBaseModel tournament) async {
    try {
      List<TeamTournamentBaseModel> listTeamTournamet = [];
      final List<dynamic> response = await _supabase.client
          .from('TeamTournament')
          .select(QuerySupabase.teamTournament)
          .eq('tournament', tournament.id);
      for (var element in response) {
        TeamTournamentBaseModel teamTournamentBaseModel =
            TeamTournamentBaseModel.fromJson(element);
        listTeamTournamet.add(teamTournamentBaseModel);
      }
      apiResult.responseObject = listTeamTournamet;
      return apiResult;
    } catch (e) {
      apiResult.message = e.toString();
      apiResult.error = e.runtimeType;
      return apiResult;
    }
  }
}
