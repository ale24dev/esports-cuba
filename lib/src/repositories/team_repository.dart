import 'package:supabase_flutter/supabase_flutter.dart';

import '../shared/repository/ApiResult.dart';
import 'package:esports_cuba/src/models/team_base_model.dart';

class TeamRepository {
  final Supabase _supabase;
  late ApiResult apiResult;
  TeamRepository(this._supabase) {
    apiResult = ApiResult();
  }

  Future<ApiResult> getAllTeams() async {
    try {
      List<TeamBaseModel> listTeams = [];
      final List<Map<String, dynamic>> response =
          await _supabase.client.from('team').select();
      for (var element in response) {
        TeamBaseModel teamBaseModel = TeamBaseModel.fromJson(element);
        listTeams.add(teamBaseModel);
      }
      apiResult.responseObject = listTeams;
      return apiResult;
    } catch (e) {
      apiResult.message = e.toString();
      apiResult.error = e.runtimeType;
      return apiResult;
    }
  }
}
