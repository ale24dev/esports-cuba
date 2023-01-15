import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:esports_cuba/src/models/game_base_model.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';

class GameDatabaseRepository {
  final Supabase _supabase;
  late ApiResult apiResult;
  GameDatabaseRepository(this._supabase) {
    apiResult = ApiResult();
  }

  Future<ApiResult> getAllGames() async {
    try {
      List<GameBaseModel> listGames = [];
      final List<Map<String, dynamic>> response =
          await _supabase.client.from('Game').select();
      for (var element in response) {
        GameBaseModel gameBaseModel = GameBaseModel.fromJson(element);
        listGames.add(gameBaseModel);
      }
      apiResult.responseObject = listGames;
      return apiResult;
    } catch (e) {
      apiResult.message = e.toString();
      apiResult.error = e.runtimeType;
      return apiResult;
    }
  }
}
