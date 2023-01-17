import 'dart:async';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:esports_cuba/src/shared/utils.dart';
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
          id: response.user!.id,
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
      {required String id,
      required String email,
      required ApiResult apiResult,
      required String username,
      required DateTime birthday}) async {
    ///Averiguar si el usuario esta repetido
    ///
    final data = await _supabase.client.from('User').insert([
      {
        'id': id,
        'username': username,
        'birthday': Utils.parseDateToTimestamp(birthday)
      },
    ]);
  }

  StreamSubscription<AuthState> listenToAuthStatus() {
    return _supabase.client.auth.onAuthStateChange.listen((data) {
      final Session? session = data.session;
      final AuthChangeEvent event = data.event;

      switch (event) {
        case AuthChangeEvent.signedIn:
          if (session != null) {
            print("FUNCIONAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
          }

          break;
        default:
          print("nada");
      }
    });
  }
}
