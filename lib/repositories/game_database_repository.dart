import 'package:esports_cuba/locator.dart';
import 'package:esports_cuba/models/game_base_model.dart';
import 'package:esports_cuba/models/user_base_model.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GameDatabaseRepository {
  final Supabase _supabase;
  late ApiResult apiResult;
  GameDatabaseRepository(this._supabase) {
    apiResult = serviceLocator<ApiResult>();
  }

  Future<ApiResult> getAllGames() async {
    try {
      List<GameBaseModel> listGames = [];
      final List<Map<String, dynamic>> response =
          await _supabase.client.from('Game').select();
      print(response);
      for (var element in response) {
        GameBaseModel gameBaseModel = GameBaseModel.fromJson(element);
        listGames.add(gameBaseModel);
      }
      //print(listGames[0].name);
      apiResult.responseObject = listGames;
      return apiResult;
    } catch (e) {
      apiResult.error = e.toString();
      apiResult.errorType = e.runtimeType;
      return apiResult;
    }
  }
}
