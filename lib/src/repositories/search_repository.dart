import 'dart:developer';

import 'package:esports_cuba/src/models/player_base_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:esports_cuba/src/shared/repository/ApiResult.dart';

import '../models/team_base_model.dart';
import '../models/tournament_base_model.dart';
import '../models/version_base_model.dart';
import '../shared/database/query_supabase.dart.dart';

class SearchRepository {
  final Supabase _supabase;
  late ApiResult apiResult;
  SearchRepository(this._supabase) {
    apiResult = ApiResult();
  }

  Future<ApiResult> getResultSearch(String text) async {
    try {
      List<dynamic> resultSearch = [];
      List<dynamic> response = [];

      response = await _supabase.client
          .from('team')
          .select(QuerySupabase.team)
          .textSearch('fts', "${text.trim().split(" ").join("&")}:*")
          .order('name', ascending: false)
          .limit(10);


      for (var element in response) {
        TeamBaseModel teamBaseModel = TeamBaseModel.fromJson(element);
        resultSearch.add(teamBaseModel);
      }

      response = await _supabase.client
          .from('tournament')
          .select(QuerySupabase.tournament)
          .textSearch('fts', "${text.trim().split(" ").join("&")}:*")
          .order('name', ascending: false)
          .limit(10);


      for (var element in response) {
        TournamentBaseModel tournamentBaseModel =
            TournamentBaseModel.fromJson(element);
        resultSearch.add(tournamentBaseModel);
      }

      response = await _supabase.client
          .from('player')
          .select(QuerySupabase.player)
          .textSearch('fts', "${text.trim().split(" ").join("&")}:*")
          .order('nickname', ascending: false)
          .limit(10);

      for (var element in response) {
        PlayerBaseModel playerBaseModel = PlayerBaseModel.fromJson(element);
        resultSearch.add(playerBaseModel);
      }

      apiResult.responseObject = resultSearch;
      return apiResult;
    } catch (e) {
      apiResult.message = e.toString();
      apiResult.error = e.runtimeType;
      return apiResult;
    }
  }
}
