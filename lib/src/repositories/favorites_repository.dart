import 'package:esports_cuba/src/models/news_base_model.dart';
import 'package:esports_cuba/src/models/user_base_model.dart';
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
  Future<ApiResult> getFavoritesByUser(int id) async {
    try {
      List<FavoritesBaseModel> listFavorites = [];
      final List<dynamic> response =
          await _supabase.client.from('Favorites').select('''
          id, created_at,
          User (
            id, nickname, password, image, created_at, phone
          ),
          News (
            id, title, text, attachments, created_at, User (
            id, nickname, password, image, created_at, phone
          ))
          ''').eq('user', id);

      for (var element in response) {
        FavoritesBaseModel favoritesBaseModel =
            FavoritesBaseModel.fromJson(element);
        listFavorites.add(favoritesBaseModel);
      }
      apiResult.responseObject = listFavorites;
      return apiResult;
    } catch (e) {
      apiResult.error = e.toString();
      apiResult.errorType = e.runtimeType;
      return apiResult;
    }
  }

  //Future<void> addFavoriteToUser(FavoritesBaseModel favoritesBaseModel, UserBaseModel userBaseModel) async {
  Future<void> addNewsToFavoriteOfUser(
      NewsBaseModel newsBaseModel, int id) async {
    try {
      final dynamic response = await _supabase.client.from('Favorites').insert([
        {'user': id, 'news': newsBaseModel.id},
      ]);
    } catch (e) {
      print(e);
    }
  }
}
