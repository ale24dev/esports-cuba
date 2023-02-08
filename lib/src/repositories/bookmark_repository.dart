import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:esports_cuba/src/shared/app_info.dart';
import 'package:esports_cuba/src/models/news_base_model.dart';
import 'package:esports_cuba/src/models/bookmark_base_model.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';

import '../models/user_base_model.dart';
import '../shared/database/query_supabase.dart.dart';

class BookmarkRepository {
  final Supabase _supabase;
  late ApiResult apiResult;
  BookmarkRepository(this._supabase) {
    apiResult = ApiResult();
  }

  //Future<ApiResult> getBookmarksByUser(UserBaseModel userBaseModel) async {
  Future<ApiResult> getBookmarksByUser(UserBaseModel user) async {
    try {
      List<BookmarkBaseModel> listBookmarks = [];
      final List<dynamic> response = await _supabase.client
          .from('bookmarks')
          .select(QuerySupabase.bookmark)
          .eq('xuser', user.id);
      for (var element in response) {
        BookmarkBaseModel bookmarkBaseModel =
            BookmarkBaseModel.fromJson(element);
        listBookmarks.add(bookmarkBaseModel);
      }
      apiResult.responseObject = listBookmarks;
      return apiResult;
    } catch (e) {
      apiResult.message = e.toString();
      apiResult.error = e;
      return apiResult;
    }
  }

  Future<ApiResult?> addBookmarkToUser(
      NewsBaseModel newsBaseModel, AppInfo appInfo) async {
    try {
      final dynamic response = await _supabase.client.from('bookmarks').insert([
        {'xuser': appInfo.user!.id, 'news': newsBaseModel.id},
      ]);
    } catch (e) {
      apiResult.error = e;
      apiResult.message = e.toString();
      return apiResult;
      //print("Error: " + e.toString());
    }
    return null;
  }

  Future<ApiResult?> removeBookmarkOfUser(
      NewsBaseModel newsBaseModel, AppInfo appInfo) async {
    try {
      await _supabase.client
          .from('bookmarks')
          .delete()
          .match({'news': newsBaseModel.id, 'xuser': appInfo.user!.id});
    } catch (e) {
      apiResult.error = e;
      apiResult.message = e.toString();
      return apiResult;
    }
    return null;
  }
}
