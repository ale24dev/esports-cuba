import 'package:esports_cuba/src/models/news_base_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:esports_cuba/src/shared/repository/ApiResult.dart';

class NewsRepository {
  final Supabase _supabase;
  late ApiResult apiResult;
  NewsRepository(this._supabase) {
    apiResult = ApiResult();
  }

  Future<ApiResult> getAllAnnouncement() async {
    try {
      List<NewsBaseModel> listGames = [];
      final List<Map<String, dynamic>> response =
          await _supabase.client.from('News').select('''
          id, created_at, text, attachments,
          User (
            id, nickname, password, image, created_at, phone
            )
          ''');
      for (var element in response) {
        NewsBaseModel announcementBaseModel = NewsBaseModel.fromJson(element);
        listGames.add(announcementBaseModel);
      }
      apiResult.responseObject = listGames;
      return apiResult;
    } catch (e) {
      apiResult.error = e.toString();
      apiResult.errorType = e.runtimeType;
      return apiResult;
    }
  }
}
