import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:esports_cuba/src/models/user_base_model.dart';
import 'package:esports_cuba/src/repositories/user_repository.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';

class AppInfo {
  static AppInfo? _appInfo;
  UserBaseModel? _user;
  late String _token;

  String get token => _token;
  UserBaseModel? get user => _user;

  void setToken(String value) {
    _token = value;
  }

  void setUser(UserBaseModel? user) {
    _user = user;
  }

  AppInfo._() {
    _token = '';
  }

  /*Future<void> validateToken(BuildContext context) async {
    try {
      _user = await UserRepository().getUser(context, _token);
      Future<SharedPreferences> preferences = SharedPreferences.getInstance();
      final SharedPreferences prefs = await preferences;
      prefs.setString('token', _token);
    } catch (e) {
      _user = null;
      _token = '';
      throw (e.toString());
    }
  }*/

  /*Future<void> setUser(BuildContext context, String id) async {
    ApiResult apiResult =
        await serviceLocator<UserRepository>().getUserById(id);
    if (apiResult.error == null) {
      _user = apiResult.responseObject;
    }
  }*/

  static Future initialize(BuildContext context) async {
    UserRepository userRepository = UserRepository(Supabase.instance);
    Future<SharedPreferences> preferences = SharedPreferences.getInstance();
    final SharedPreferences prefs = await preferences;
    String token = prefs.getString('token') ?? '';
    String username = prefs.getString('username') ?? '';
    if (token.isNotEmpty) {
      _appInfo!.setToken(token);
      try {
        ApiResult apiResult = await userRepository.getUserByUsername(username);
        if (apiResult.error == null) {
          _appInfo!.setUser(apiResult.responseObject);
        }
      } catch (e) {
        _appInfo!.setUser(null);
      }
    } else {
      _appInfo!.setToken('');
    }
  }

  Future<void> removeToken() async {
    Future<SharedPreferences> preferences = SharedPreferences.getInstance();
    final SharedPreferences prefs = await preferences;
    prefs.remove('token');
    _token = '';
  }

  Future<void> removeUser() async {
    _user = null;
  }

  static Future<AppInfo?> getInstace(BuildContext? context) async {
    if (_appInfo == null) {
      _appInfo = AppInfo._();
      await initialize(context!);
    }
    return _appInfo;
  }
}
