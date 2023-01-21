import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:esports_cuba/locator.dart';
import 'package:esports_cuba/src/shared/app_info.dart';
import 'package:esports_cuba/src/models/news_base_model.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';
import 'package:esports_cuba/src/repositories/favorites_repository.dart';

part 'favorites_state.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  BookmarkCubit() : super(FavoritesInitial());

  // void loadFavoritesByUser(UserBaseModel userBaseModel) async {
  void loadFavoritesByUser() async {
    emit(FavoritesLoading());
    ApiResult apiResult = await serviceLocator<BookmarkRepository>()
        // .getFavoritesByUser(userBaseModel);
        .getFavoritesByUser();
    if (apiResult.error == null) {
      if (apiResult.responseObject.length == 0) {
        emit(FavoritesEmpty());
      } else {
        emit(FavoritesLoaded(apiResult: apiResult));
      }
    }
  }

  void addNewsToFavoriteOfUser(NewsBaseModel newsBaseModel, context) async {
    AppInfo? appInfo = await AppInfo.getInstace(context);
    if (appInfo != null) {
      emit(FavoritesLoading());
      await serviceLocator<BookmarkRepository>()
          .addNewsToFavoriteOfUser(newsBaseModel, appInfo);

      ApiResult apiResult = await serviceLocator<BookmarkRepository>()
          .getFavoritesByUser();

      if (apiResult.error == null) {
        if (apiResult.responseObject.length == 0) {
          FavoritesEmpty();
        } else {
          emit(FavoritesLoaded(apiResult: apiResult));
        }
      }
    } else {
      emit(FavoritesError());
    }
  }
}
