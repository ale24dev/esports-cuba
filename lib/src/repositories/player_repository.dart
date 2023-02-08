import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/player_base_model.dart';
import '../shared/repository/ApiResult.dart';

class PlayerRepository {
  final Supabase _supabase;
  late ApiResult apiResult;
  PlayerRepository(this._supabase) {
    apiResult = ApiResult();
  }

  Future<ApiResult> getAllPlayers() async {
    try {
      List<PlayerBaseModel> listPlayers = [];
      final List<Map<String, dynamic>> response =
          await _supabase.client.from('Player').select();
      for (var element in response) {
        PlayerBaseModel playerBaseModel = PlayerBaseModel.fromJson(element);
        listPlayers.add(playerBaseModel);
      }
      apiResult.responseObject = listPlayers;
      return apiResult;
    } catch (e) {
      apiResult.message = e.toString();
      apiResult.error = e.runtimeType;
      return apiResult;
    }
  }
}
