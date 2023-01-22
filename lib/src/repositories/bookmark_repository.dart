import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:esports_cuba/src/shared/app_info.dart';
import 'package:esports_cuba/src/models/news_base_model.dart';
import 'package:esports_cuba/src/models/bookmark_base_model.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';

class BookmarkRepository {
  final Supabase _supabase;
  late ApiResult apiResult;
  BookmarkRepository(this._supabase) {
    apiResult = ApiResult();
  }

  //Future<ApiResult> getBookmarksByUser(UserBaseModel userBaseModel) async {
  Future<ApiResult> getBookmarksByUser(BuildContext context) async {
    AppInfo? appInfo = await AppInfo.getInstace(context);
    print(appInfo!.user.toString());

    try {
      List<BookmarkBaseModel> listBookmarks = [];
      final List<dynamic> response =
          await _supabase.client.from('Bookmarks').select('''
          id, created_at,
          User (
            id, username, image, email
          ),
          News (
            id, title, text, attachments, created_at, User (
            id, username, image, email
          ))
          ''').eq('user', appInfo!.user!.id);
      print(response.toString());
      for (var element in response) {
        BookmarkBaseModel bookmarkBaseModel =
            BookmarkBaseModel.fromJson(element);
        listBookmarks.add(bookmarkBaseModel);
      }
      apiResult.responseObject = listBookmarks;
      return apiResult;
    } catch (e) {
      print(e.toString());
      apiResult.message = e.toString();
      apiResult.error = e;
      return apiResult;
    }
  }

  //Future<void> addFavoriteToUser(BookmarkBaseModel bookmarkBaseModel, UserBaseModel userBaseModel) async {
  Future<void> addBookmarkToUser(
      NewsBaseModel newsBaseModel, AppInfo appInfo) async {
    try {
      final dynamic response = await _supabase.client.from('Bookmarks').insert([
        {'user': appInfo.user!.id, 'news': newsBaseModel.id},
      ]);
    } catch (e) {
      print("Error: " + e.toString());
    }
  }
}
