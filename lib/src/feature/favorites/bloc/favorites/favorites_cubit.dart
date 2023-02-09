// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:esports_cuba/src/models/favorites_base_model.dart';
import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:esports_cuba/src/shared/utils.dart';
import 'package:flutter/material.dart';

import '../../../../../locator.dart';
import '../../../../models/tournament_base_model.dart';
import '../../../../models/user_base_model.dart';
import '../../../../repositories/favorites_repository.dart';
import '../../../../shared/app_info.dart';
import '../../../../shared/repository/ApiResult.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());

  late List<dynamic> listLocalFavs;

  void loadFavs(UserBaseModel user) async {
    ///Inicalizamos la lista local de Favoritos
    listLocalFavs = [];
    emit(FavoritesLoading());

    ApiResult apiResult =
        await serviceLocator<FavoritesRepository>().getFavorites(user);

    if (apiResult.error == null) {
      if (apiResult.responseObject.length == 0) {
        emit(FavoritesEmpty());
      } else {
        ///Añadimos localmente los anuncios a la lista de bookmarks
        List<FavoritesBaseModel> listFavorites = apiResult.responseObject;

        ///Añadimos en dependencia de cual tipo de favorito sea a la lista local de favoritos
        for (var favs in listFavorites) {
          if (favs.playerBaseModel != null) {
            listLocalFavs.add(favs.playerBaseModel);
          } else if (favs.teamBaseModel != null) {
            listLocalFavs.add(favs.teamBaseModel);
          } else if (favs.tournamentBaseModel != null) {
            listLocalFavs.add(favs.tournamentBaseModel);
          }
        }
        emit(FavoritesLoaded(
          apiResult: ApiResult(responseObject: listLocalFavs),
        ));
      }
    } else {
      emit(FavoritesError(apiResult: apiResult));
    }
  }

  void addLocalFavoriteToUser(dynamic favorite, BuildContext context) {
    ///Añadimos localmente el favorito a la lista
    listLocalFavs.add(favorite);
    emit(FavoritesLoading());
    emit(FavoritesLoaded(apiResult: ApiResult(responseObject: listLocalFavs)));

    ///Añadimos el elemento a la BD
    addFavoriteToUser(favorite, context);
  }

  void removeLocalFavoriteToUser(dynamic favorite, BuildContext context) {
    ///Bandera que determina si se encontro el elemento
    bool found = false;
    for (var i = 0; i < listLocalFavs.length || !found; i++) {
      if (listLocalFavs[i].runtimeType == favorite.runtimeType) {
        if (listLocalFavs[i].id == favorite.id) {
          found = true;
          listLocalFavs.removeAt(i);
        }
      }
    }
    if (listLocalFavs.isEmpty) {
      emit(FavoritesEmpty());
    } else {
      emit(FavoritesLoading());
      emit(
          FavoritesLoaded(apiResult: ApiResult(responseObject: listLocalFavs)));
    }

    ///Eliminamos el elemento a la BD
    removeFavoriteToUser(favorite, context);
  }

  void addFavoriteToUser(dynamic favorite, BuildContext context) async {
    AppInfo? appInfo = await AppInfo.getInstace(context);

    if (appInfo != null) {
      ApiResult? apiResult = await serviceLocator<FavoritesRepository>()
          .addFavoriteToUser(favorite, appInfo);

      if (apiResult != null) {
        emit(FavoritesError(apiResult: apiResult));
      }
    } else {
      emit(FavoritesError(
          apiResult: ApiResult(message: context.loc.unexpectedError)));
    }
  }

  void removeFavoriteToUser(dynamic favorite, BuildContext context) async {
    AppInfo? appInfo = await AppInfo.getInstace(context);
    if (appInfo != null) {
      ApiResult? apiResult = await serviceLocator<FavoritesRepository>()
          .removeFavoriteToUser(favorite, appInfo);
      if (apiResult != null) {
        ///Añadimos la noticia añadida a la lista local
        listLocalFavs.add(favorite);
        emit(FavoritesError(apiResult: apiResult));
      }
    }
  }

  List<TournamentBaseModel> getPopularTournaments(
      List<TournamentBaseModel> listTournamentsBaseModel) {
    return Utils.getPopularTournaments(listTournamentsBaseModel);
  }
}
