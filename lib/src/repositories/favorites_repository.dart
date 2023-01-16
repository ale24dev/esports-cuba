import 'package:esports_cuba/src/models/news_base_model.dart';
import 'package:esports_cuba/src/models/user_base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
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
            id, username, email, image, birthday, created_at
          ),
          News (
            id, title, text, attachments, created_at, User (
            id, username, email, image, birthday, created_at
          ))
          ''');
      print("RESPONSE: " + response.toString());
      for (var element in response) {
        FavoritesBaseModel favoritesBaseModel =
            FavoritesBaseModel.fromJson(element);
        listFavorites.add(favoritesBaseModel);
      }
      apiResult.responseObject = listFavorites;
      return apiResult;
    } catch (e) {
      print("Error: " + e.toString());
      apiResult.message = e.toString();
      apiResult.error = e;
      return apiResult;
    }
  }

  //Future<void> addFavoriteToUser(FavoritesBaseModel favoritesBaseModel, UserBaseModel userBaseModel) async {
  Future<void> addNewsToFavoriteOfUser(
      NewsBaseModel newsBaseModel, int id) async {
    try {
      final dynamic response = await _supabase.client.from('Favorites').insert([
        {'user': 12, 'news': newsBaseModel.id},
      ]);
    } catch (e) {
      print("Error: " + e.toString());
    }
  }
}
