import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:esports_cuba/src/shared/repository/ApiResult.dart';

import '../models/version_base_model.dart';

class VersionRepository {
  final Supabase _supabase;
  late ApiResult apiResult;
  VersionRepository(this._supabase) {
    apiResult = ApiResult();
  }

  Future<ApiResult> getVersion() async {
    try {
      List<VersionBaseModel> version = [];
      PackageInfo packageInfo = await PackageInfo.fromPlatform();

      final List<dynamic> response = await _supabase.client
          .from('Version')
          .select()
          .order('id', ascending: false)
          .limit(1);
      for (var element in response) {
        VersionBaseModel versionBaseModel = VersionBaseModel.fromJson(element);
        versionBaseModel.versionApp = packageInfo.version;
        version.add(versionBaseModel);
      }

      apiResult.responseObject = version;
      return apiResult;
    } catch (e) {
      apiResult.message = e.toString();
      apiResult.error = e.runtimeType;
      return apiResult;
    }
  }
}
