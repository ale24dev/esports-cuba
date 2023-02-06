// ignore_for_file: body_might_complete_normally_nullable

import 'dart:developer';

import 'package:esports_cuba/src/models/player_base_model.dart';
import 'package:esports_cuba/src/models/team_base_model.dart';
import 'package:esports_cuba/src/models/tournament_base_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:esports_cuba/src/shared/repository/ApiResult.dart';

import '../models/favorites_base_model.dart';
import '../models/user_base_model.dart';
import '../models/version_base_model.dart';
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

      final List<dynamic> response =
          await _supabase.client.from('favorites').select('''id,
            xuser(id, username, image, email),
            Team(id, name, created_at, country, ceo, image_header, image_logo),
            Player(id, nickname, name, image, country),               
            Tournament(
              id, name, created_at, edition,
                    active, image_logo, image_header,
                    quantity_groups, max_teams, prizepool, description,
                    TournamentType(id, name),
                    TournamentState(id, state),
                    Game(id, name, image),
                    Winners(id, first_place, second_place, third_place)
                    )
                 ''').eq('xuser', user.id);
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
