import 'dart:developer';

import 'package:esports_cuba/locator.dart';
import 'package:esports_cuba/src/models/tournament_state_base_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:esports_cuba/src/models/game_base_model.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';
import 'package:esports_cuba/src/models/tournament_base_model.dart';

class TournamentRepository {
  late final Supabase _supabase;
  late ApiResult apiResult;
  TournamentRepository(this._supabase) {
    apiResult = ApiResult();
  }

  Future<ApiResult> getAllTournaments() async {
    try {
      List<TournamentBaseModel> listTournaments = [];
      final List<Map<String, dynamic>> response = await _supabase.client
          .from('Tournament')
          .select('''id, name, created_at, edition,
               active, image_logo, image_header,
                quantity_groups, max_teams, prizepool, description,
                 TournamentType(id, name),
                 TournamentState(id, state),
                 Game(id, name, image),
                 Winners(id, first_place, second_place, third_place)
                 ''');
      for (var element in response) {
        TournamentBaseModel tournamentBaseModel =
            TournamentBaseModel.fromJson(element);
        listTournaments.add(tournamentBaseModel);
      }
      apiResult.responseObject = listTournaments;
      return apiResult;
    } catch (e) {
      apiResult.message = e.toString();
      apiResult.error = e.runtimeType;
      return apiResult;
    }
  }

  Future<ApiResult> getTournamentsByGame(GameBaseModel game) async {
    try {
      List<TournamentBaseModel> listTournaments = [];
      final List<dynamic> response = await _supabase.client
          .from('Tournament')
          .select('''id, name, created_at, edition,
               active, image_logo, image_header,
                quantity_groups, max_teams, prizepool,
                 TournamentType(id, name),
                 TournamentState(id, state),
                 Game(id, name, image),
                 Winners(id, first_place, second_place, third_place)
                 ''').eq('game', '${game.id}');
      log(response.toString());
      for (var element in response) {
        TournamentBaseModel gameBaseModel =
            TournamentBaseModel.fromJson(element);
        listTournaments.add(gameBaseModel);
      }
      apiResult.responseObject = listTournaments;
      return apiResult;
    } catch (e) {
      apiResult.message = e.toString();
      apiResult.error = e.runtimeType;
      return apiResult;
    }
  }

  Future<ApiResult> getStateByTournament(TournamentBaseModel tournament) async {
    try {
      final Map<String, dynamic> response = await _supabase.client
          .from('Tournament_State')
          .select()
          .match({'id': tournament.tournamentState}).single();
      TournamentStateBaseModel gameBaseModel =
          TournamentStateBaseModel.fromJson(response);
      apiResult.responseObject = gameBaseModel;

      return apiResult;
    } catch (e) {
      apiResult.message = e.toString();
      apiResult.error = e.runtimeType;
      return apiResult;
    }
  }
}
