import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:esports_cuba/src/models/game_base_model.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';
import 'package:esports_cuba/src/models/tournament_base_model.dart';
import 'package:esports_cuba/src/models/tournament_state_base_model.dart';
import 'package:esports_cuba/src/shared/database/query_supabase.dart.dart';

import '../feature/tournament/constants/tournament_state_type.dart';

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
          .from('tournament')
          .select(QuerySupabase.tournament);
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
          .from('tournament')
          .select(QuerySupabase.tournament)
          .eq('game', '${game.id}');
      for (var element in response) {
        TournamentBaseModel gameBaseModel =
            TournamentBaseModel.fromJson(element);
        listTournaments.add(gameBaseModel);
      }
      apiResult.responseObject = listTournaments;
      return apiResult;
    } catch (e) {
      log(e.toString());
      apiResult.message = e.toString();
      apiResult.error = e.runtimeType;
      return apiResult;
    }
  }

  Future<ApiResult> getTournamentsByGameAndState(
      GameBaseModel game, TournamentStateType tournamentStateType) async {
    try {
      List<TournamentBaseModel> listTournaments = [];
      final List<dynamic> response = await _supabase.client
          .from('tournament')
          .select(QuerySupabase.tournament)
          .match({'game': '${game.id}', 'tournament_state.state': 'open'});
      for (var element in response) {
        TournamentBaseModel gameBaseModel =
            TournamentBaseModel.fromJson(element);
        listTournaments.add(gameBaseModel);
      }
      apiResult.responseObject = listTournaments;
      return apiResult;
    } catch (e) {
      log(e.toString());
      apiResult.message = e.toString();
      apiResult.error = e.runtimeType;
      return apiResult;
    }
  }

  Future<ApiResult> getStateByTournament(TournamentBaseModel tournament) async {
    try {
      final Map<String, dynamic> response = await _supabase.client
          .from('tournamentstate')
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
