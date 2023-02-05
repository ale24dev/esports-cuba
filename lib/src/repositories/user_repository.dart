import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:esports_cuba/src/models/user_base_model.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';

class UserRepository {
  final Supabase _supabase;
  late ApiResult apiResult;
  UserRepository(this._supabase) {
    apiResult = ApiResult();
  }

  Future<ApiResult> getAllUser() async {
    try {
      List<UserBaseModel> listUsers = [];
      final List<Map<String, dynamic>> response =
          await _supabase.client.from('xuser').select();
      for (var element in response) {
        UserBaseModel gameBaseModel = UserBaseModel.fromJson(element);
        listUsers.add(gameBaseModel);
      }
      apiResult.responseObject = listUsers;
      return apiResult;
    } catch (e) {
      apiResult.message = e.toString();
      apiResult.error = e.runtimeType;
      return apiResult;
    }
  }

  Future<ApiResult> getUserByEmail(String email) async {
    try {
      final Map<String, dynamic> response =
          await _supabase.client.from('xuser').select().eq('email', email).single();
      UserBaseModel userBaseModel = UserBaseModel.fromJson(response);
      apiResult.responseObject = userBaseModel;
      return apiResult;
    } catch (e) {
      print("ERROR User Id: " + e.toString());
      apiResult.message = e.toString();
      apiResult.error = e.runtimeType;
      return apiResult;
    }
  }

  Future<ApiResult> getUserByUsername(String username) async {
    try {
      final Map<String, dynamic> response = await _supabase.client
          .from('xuser')
          .select()
          .eq("username", username)
          .single();
      UserBaseModel userBaseModel = UserBaseModel.fromJson(response);
      apiResult.responseObject = userBaseModel;
      return apiResult;
    } catch (e) {
      apiResult.message = e.toString();
      apiResult.error = e.runtimeType;
      return apiResult;
    }
  }
}
