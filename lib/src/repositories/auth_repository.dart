// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:esports_cuba/locator.dart';
import 'package:esports_cuba/src/models/user_base_model.dart';
import 'package:esports_cuba/src/repositories/user_repository.dart';
import 'package:esports_cuba/src/shared/app_info.dart';
import 'package:flutter/material.dart';
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
      required ApiResult apiResult}) async {
    try {
      AuthResponse response =
          await _supabase.client.auth.signUp(email: email, password: password);

      await createUser(
          id: response.user!.id,
          apiResult: ApiResult(),
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
      required String username}) async {
    ///Averiguar si el usuario esta repetido
    ///
    await _supabase.client.from('xuser').insert([
      {
        'id': id,
        'username': username,
        'email': email
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

  Future<ApiResult> logIn(
      {required BuildContext context,
      required String email,
      required String password,
      required ApiResult apiResult}) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final AuthResponse res = await _supabase.client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      final Session? session = res.session;

      apiResult = await serviceLocator<UserRepository>()
          .getUserByEmail(session!.user.email!);
      sharedPreferences.setString("token", session.accessToken);
      sharedPreferences.setString(
          "username", apiResult.responseObject.username);

      await AppInfo.getInstace(context);
      return apiResult;
    } catch (e) {
      apiResult = ApiResult();
      apiResult.error = e;
      apiResult.message = e.toString();
      return apiResult;
    }
  }

  Future<void> logOut() async {
    await _supabase.client.auth.signOut();
  }
}
