import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:esports_cuba/src/shared/repository/ApiResult.dart';

class VersionRepository {
  final Supabase _supabase;
  late ApiResult apiResult;
  VersionRepository(this._supabase) {
    apiResult = ApiResult();
  }

  Future<void> getVersion() async {
    try {
      final List<dynamic> response = await _supabase.client
          .from('Version')
          .select()
          .order('id', ascending: false)
          .limit(1);

      //VersionBaseModel gameBaseModel = VersionBaseModel.fromJson(response);

      // apiResult.responseObject = gameBaseModel;
      //return apiResult;
    } catch (e) {
      apiResult.message = e.toString();
      apiResult.error = e.runtimeType;
      //return apiResult;
    }
  }
}
