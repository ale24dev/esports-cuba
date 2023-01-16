import 'package:esports_cuba/constants.dart';
import 'package:esports_cuba/src/models/user_base_model.dart';
import 'package:esports_cuba/src/shared/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:esports_cuba/src/shared/repository/ApiResult.dart';

class AuthRepository {
  AuthRepository(this._supabase);

  final Supabase _supabase;

  Future<ApiResult> signUp(
      {required String username,
      required String email,
      required String password,
      required ApiResult apiResult,
      required DateTime birthday}) async {
    try {
      AuthResponse response =
          await _supabase.client.auth.signUp(email: email, password: password);

      await createUser(
          apiResult: ApiResult(),
          birthday: birthday,
          email: email,
          username: username);

      apiResult.responseObject = response.session!;
      apiResult.message = "Registro exitoso";

      SharedPreferences sharedPreferences =
          await Utils.sharedPreferencesInstance();
      sharedPreferences.setString("token", response.session!.accessToken);
      sharedPreferences.setString("username", username);

      return apiResult;
    } catch (e) {
      apiResult.error = e;
      apiResult.message = e.toString();
      return apiResult;
    }
  }

  Future<void> createUser(
      {required String email,
      required ApiResult apiResult,
      required String username,
      required DateTime birthday}) async {
    await _supabase.client.from('User').insert([
      {
        'username': username,
        'email': email,
        'birthday': Utils.parseDateToTimestamp(birthday)
      },
    ]);
  }
}
