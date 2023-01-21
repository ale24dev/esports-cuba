import 'package:esports_cuba/src/models/tournament_base_model.dart';
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
    print(tournament.id);
    try {
      List<TeamTournamentBaseModel> listTeamTournamet = [];
      final List<dynamic> response =
          await _supabase.client.from('TeamTournament').select('''
          id, created_at, active,
          Team (
            id, name, created_at, country, ceo, image_header, image_logo
          )
          ''').eq('tournament', tournament.id);
      print(response.toString());
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
