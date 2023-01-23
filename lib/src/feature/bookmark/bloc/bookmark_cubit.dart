import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:esports_cuba/locator.dart';
import 'package:esports_cuba/src/models/bookmark_base_model.dart';
import 'package:esports_cuba/src/shared/app_info.dart';
import 'package:esports_cuba/src/models/news_base_model.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';
import 'package:esports_cuba/src/repositories/bookmark_repository.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/user_base_model.dart';

part 'bookmark_state.dart';

class BookmarkCubit extends Cubit<BookmarkState> {

  BookmarkCubit() : super(BookmarkInitial());


  void loadBookmarkByUser(UserBaseModel user) async {
    emit(BookmarkLoading());
    ApiResult apiResult =
        await serviceLocator<BookmarkRepository>().getBookmarksByUser(user);
    if (apiResult.error == null) {
      if (apiResult.responseObject.length == 0) {
        emit(BookmarkEmpty());
      } else {
        emit(BookmarkLoaded(apiResult: apiResult, loading: true));
      }
    }
  }

  void addBookmarkToUser(
      NewsBaseModel newsBaseModel, BuildContext context) async {
    AppInfo? appInfo = await AppInfo.getInstace(context);
    if (appInfo != null) {
      await serviceLocator<BookmarkRepository>()
          .addBookmarkToUser(newsBaseModel, appInfo);

      ApiResult apiResult = await serviceLocator<BookmarkRepository>()
          .getBookmarksByUser(appInfo.user!);

      if (apiResult.error == null) {
        if (apiResult.responseObject.length == 0) {
          BookmarkEmpty();
        } else {
          emit(BookmarkLoading());
          emit(BookmarkLoaded(apiResult: apiResult, loading: false));
        }
      }
    } else {
      emit(BookmarkError());
    }
  }

  void removeBookmarkOfUser(
      NewsBaseModel newsBaseModel, BuildContext context) async {
    AppInfo? appInfo = await AppInfo.getInstace(context);
    if (appInfo != null) {
      await serviceLocator<BookmarkRepository>()
          .removeBookmarkOfUser(newsBaseModel, appInfo);

      ApiResult apiResult = await serviceLocator<BookmarkRepository>()
          .getBookmarksByUser(appInfo.user!);

      if (apiResult.error == null) {
        if (apiResult.responseObject.length == 0) {
          emit(BookmarkEmpty());
        } else {
          emit(BookmarkLoading());
          emit(BookmarkLoaded(apiResult: apiResult, loading: false));
        }
      }
    } else {
      emit(BookmarkError());
    }
  }
}
