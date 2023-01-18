import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:esports_cuba/src/shared/app_info.dart';
import 'package:esports_cuba/src/models/news_base_model.dart';
import 'package:esports_cuba/src/models/favorites_base_model.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';

class FavoritesRepository {
  final Supabase _supabase;
  late ApiResult apiResult;
  FavoritesRepository(this._supabase) {
    apiResult = ApiResult();
  }

  //Future<ApiResult> getFavoritesByUser(UserBaseModel userBaseModel) async {
  Future<ApiResult> getFavoritesByUser() async {
    String? username = await SharedPreferences.getInstance()
        .then((value) => value.getString("username"));
    try {
      List<FavoritesBaseModel> listFavorites = [];
      final List<dynamic> response =
          await _supabase.client.from('Favorites').select('''
          id, created_at,
          User (
            id, username, image, birthday, email
          ),
          News (
            id, title, text, attachments, created_at, User (
            id, username, image, birthday, email
          ))
          ''');
      for (var element in response) {
        FavoritesBaseModel favoritesBaseModel =
            FavoritesBaseModel.fromJson(element);
        listFavorites.add(favoritesBaseModel);
      }
      apiResult.responseObject = listFavorites;
      return apiResult;
    } catch (e) {
      apiResult.message = e.toString();
      apiResult.error = e;
      return apiResult;
    }
  }

  //Future<void> addFavoriteToUser(FavoritesBaseModel favoritesBaseModel, UserBaseModel userBaseModel) async {
  Future<void> addNewsToFavoriteOfUser(
      NewsBaseModel newsBaseModel, AppInfo appInfo) async {
    try {
      final dynamic response = await _supabase.client.from('Favorites').insert([
        {'user': appInfo.user!.id, 'news': newsBaseModel.id},
      ]);
    } catch (e) {
      print("Error: " + e.toString());
    }
  }
}
