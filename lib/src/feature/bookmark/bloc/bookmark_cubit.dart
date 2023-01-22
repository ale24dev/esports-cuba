import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:esports_cuba/locator.dart';
import 'package:esports_cuba/src/shared/app_info.dart';
import 'package:esports_cuba/src/models/news_base_model.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';
import 'package:esports_cuba/src/repositories/bookmark_repository.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/user_base_model.dart';

part 'bookmark_state.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  BookmarkCubit() : super(BookmarkInitial());

  // void loadBookmarkByUser(UserBaseModel userBaseModel) async {
  void loadBookmarkByUser(UserBaseModel user) async {
    emit(BookmarkLoading());
    ApiResult apiResult = await serviceLocator<BookmarkRepository>()
        .getBookmarksByUser(user);
    if (apiResult.error == null) {
      if (apiResult.responseObject.length == 0) {
        emit(BookmarkEmpty());
      } else {
        emit(BookmarkLoaded(apiResult: apiResult));
      }
    }
  }

  void addBookmarkToUser(NewsBaseModel newsBaseModel, context) async {
    AppInfo? appInfo = await AppInfo.getInstace(context);
    if (appInfo != null) {
      emit(BookmarkLoading());
      await serviceLocator<BookmarkRepository>()
          .addBookmarkToUser(newsBaseModel, appInfo);

      ApiResult apiResult = await serviceLocator<BookmarkRepository>()
          .getBookmarksByUser(context);

      if (apiResult.error == null) {
        if (apiResult.responseObject.length == 0) {
          BookmarkEmpty();
        } else {
          emit(BookmarkLoaded(apiResult: apiResult));
        }
      }
    } else {
      emit(BookmarkError());
    }
  }
}
