import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:esports_cuba/locator.dart';

import 'package:esports_cuba/src/models/news_base_model.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';
import 'package:esports_cuba/src/repositories/favorites_repository.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());

  // void loadFavoritesByUser(UserBaseModel userBaseModel) async {
  void loadFavoritesByUser() async {
    emit(FavoritesLoading());
    ApiResult apiResult = await serviceLocator<FavoritesRepository>()
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

  //void addNewsToFavoriteOfUser(UserBaseModel userBaseModel, NewsBaseModel newsBaseModel) async {
  void addNewsToFavoriteOfUser(int id, NewsBaseModel newsBaseModel) async {
    emit(FavoritesLoading());
    await serviceLocator<FavoritesRepository>()
        // .getFavoritesByUser(userBaseModel);
        .addNewsToFavoriteOfUser(newsBaseModel, id);

    ApiResult apiResult = await serviceLocator<FavoritesRepository>()
        // .getFavoritesByUser(userBaseModel);
        .getFavoritesByUser();

    if (apiResult.error == null) {
      if (apiResult.responseObject.length == 0) {
        FavoritesEmpty();
      } else {
        emit(FavoritesLoaded(apiResult: apiResult));
      }
    }
  }
}
