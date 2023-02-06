// ignore_for_file: use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:esports_cuba/locator.dart';
import 'package:esports_cuba/src/models/bookmark_base_model.dart';
import 'package:esports_cuba/src/shared/app_info.dart';
import 'package:esports_cuba/src/models/news_base_model.dart';
import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';
import 'package:esports_cuba/src/repositories/bookmark_repository.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/user_base_model.dart';

part 'bookmark_state.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  ///Lista lógica que maneja de manera local los bookmarks de los usuarios
  late List<NewsBaseModel> listLocalBookmarks;

  BookmarkCubit() : super(BookmarkInitial());

  void loadBookmarkByUser(UserBaseModel user) async {
    ///Inicalizamos la lista local de Bookmarks
    listLocalBookmarks = [];
    emit(BookmarkLoading());
    ApiResult apiResult =
        await serviceLocator<BookmarkRepository>().getBookmarksByUser(user);
    if (apiResult.error == null) {
      if (apiResult.responseObject.length == 0) {
        emit(BookmarkEmpty());
      } else {
        ///Añadimos localmente los anuncios a la lista de bookmarks
        List<BookmarkBaseModel> listBookmarks = apiResult.responseObject;
        for (var bookmark in listBookmarks) {
          listLocalBookmarks.add(bookmark.newsBaseModel);
        }
        emit(BookmarkLoaded(
            apiResult: ApiResult(responseObject: listLocalBookmarks),
            loading: true));
      }
    }
  }

  void addBookmarkLocalToUser(
      NewsBaseModel newsBaseModel, BuildContext context) async {
    listLocalBookmarks.add(newsBaseModel);
    addBookmarkToUser(newsBaseModel, context);
    emit(BookmarkLoading());
    emit(BookmarkLoaded(
        apiResult: ApiResult(responseObject: listLocalBookmarks),
        loading: false));
  }

  void addBookmarkToUser(
      NewsBaseModel newsBaseModel, BuildContext context) async {
    AppInfo? appInfo = await AppInfo.getInstace(context);
    if (appInfo != null) {
      ApiResult? apiResult = await serviceLocator<BookmarkRepository>()
          .addBookmarkToUser(newsBaseModel, appInfo);

      if (apiResult != null) {
        ///Eliminamos la noticia añadida a la lista local
        listLocalBookmarks.removeWhere((element) {
          return element.id == newsBaseModel.id;
        });

        emit(BookmarkError(apiResult: apiResult));
      }
    } else {
      emit(BookmarkError(
          apiResult: ApiResult(message: context.loc.unexpectedError)));
    }
  }

  void removeLocalBookmarkOfUser(
      NewsBaseModel newsBaseModel, BuildContext context) {
    removeBookmarkOfUser(newsBaseModel, context);

    ///Bandera que determina si se encontro el elemento
    bool found = false;
    for (var i = 0; i < listLocalBookmarks.length || !found; i++) {
      if (listLocalBookmarks[i].id == newsBaseModel.id) {
        found = true;
        listLocalBookmarks.removeAt(i);
      }
    }
    if (listLocalBookmarks.isEmpty) {
      emit(BookmarkEmpty());
    } else {
      emit(BookmarkLoading());
      emit(BookmarkLoaded(
          apiResult: ApiResult(responseObject: listLocalBookmarks),
          loading: false));
    }
  }

  void removeBookmarkOfUser(
      NewsBaseModel newsBaseModel, BuildContext context) async {
    AppInfo? appInfo = await AppInfo.getInstace(context);
    if (appInfo != null) {
      ApiResult? apiResult = await serviceLocator<BookmarkRepository>()
          .removeBookmarkOfUser(newsBaseModel, appInfo);
      if (apiResult != null) {
        ///Añadimos la noticia añadida a la lista local
        listLocalBookmarks.add(newsBaseModel);
        emit(BookmarkError(apiResult: apiResult));
      }
    }
  }
}
