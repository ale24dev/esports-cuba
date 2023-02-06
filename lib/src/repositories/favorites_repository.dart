// ignore_for_file: body_might_complete_normally_nullable

import 'dart:developer';

import 'package:esports_cuba/src/models/player_base_model.dart';
import 'package:esports_cuba/src/models/team_base_model.dart';
import 'package:esports_cuba/src/models/tournament_base_model.dart';
import 'package:esports_cuba/src/shared/database/query_supabase.dart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:esports_cuba/src/shared/repository/ApiResult.dart';

import '../models/favorites_base_model.dart';
import '../models/user_base_model.dart';
import '../shared/app_info.dart';

class FavoritesRepository {
  final Supabase _supabase;
  late ApiResult apiResult;
  FavoritesRepository(this._supabase) {
    apiResult = ApiResult();
  }

  Future<ApiResult> getFavorites(UserBaseModel user) async {
    try {
      List<FavoritesBaseModel> listFavorites = [];

      final List<dynamic> response = await _supabase.client
          .from('favorites')
          .select(QuerySupabase.favorites)
          .eq('xuser', user.id);

      print(response);
      for (var element in response) {
        FavoritesBaseModel favoritesBaseModel =
            FavoritesBaseModel.fromJson(element);

        listFavorites.add(favoritesBaseModel);
      }
      apiResult.responseObject = listFavorites;
      return apiResult;
    } catch (e) {
      apiResult.message = e.toString();
      apiResult.error = e.runtimeType;
      return apiResult;
    }
  }

  Future<ApiResult?> addFavoriteToUser(
      dynamic favorite, AppInfo appInfo) async {
    try {
      if (favorite is PlayerBaseModel) {
      } else if (favorite is TeamBaseModel) {
      } else if (favorite is TournamentBaseModel) {
        await _supabase.client.from('favorites').insert([
          {"tournament": favorite.id, "xuser": appInfo.user!.id},
        ]);
      }
    } catch (e) {
      apiResult.error = e;
      apiResult.message = e.toString();
      return apiResult;
    }
  }
}
