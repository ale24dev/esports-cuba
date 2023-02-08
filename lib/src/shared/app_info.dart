import 'package:esports_cuba/locator.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:esports_cuba/src/models/user_base_model.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';
import 'package:esports_cuba/src/repositories/user_repository.dart';

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

  static Future initialize(BuildContext context) async {
    Future<SharedPreferences> preferences = SharedPreferences.getInstance();
    final SharedPreferences prefs = await preferences;
    String token = prefs.getString('token') ?? '';
    if (token.isNotEmpty) {
      _appInfo!.setToken(token);
      try {
        String username = prefs.getString('username') ?? '';

        ApiResult apiResult =
            await serviceLocator<UserRepository>().getUserByUsername(username);
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

  static Future<void> initUser(SharedPreferences prefs) async {
    try {
      String username = prefs.getString('username') ?? '';
      ApiResult apiResult =
          await serviceLocator<UserRepository>().getUserByUsername(username);
      if (apiResult.error == null) {
        _appInfo!.setUser(apiResult.responseObject);
      }
    } catch (e) {
      _appInfo!.setUser(null);
    }
  }
}
