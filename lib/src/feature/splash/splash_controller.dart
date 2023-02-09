// ignore_for_file: use_build_context_synchronously
import 'dart:io';

import 'package:esports_cuba/src/feature/favorites/bloc/favorites/favorites_cubit.dart';
import 'package:esports_cuba/src/feature/player/cubit/player_cubit.dart';
import 'package:esports_cuba/src/feature/splash/widgets/update_dialog.dart';
import 'package:esports_cuba/src/feature/team/bloc/team_cubit.dart';
import 'package:esports_cuba/src/models/version_base_model.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:esports_cuba/locator.dart';
import 'package:esports_cuba/src/shared/app_info.dart';
import 'package:esports_cuba/src/route/app_router.gr.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';
import 'package:esports_cuba/src/feature/news/bloc/news_cubit.dart';
import 'package:esports_cuba/src/repositories/version_repository.dart';
import 'package:esports_cuba/src/feature/about/bloc/version_cubit.dart';
import 'package:esports_cuba/src/feature/drawer/cubit/drawer_cubit.dart';
import 'package:esports_cuba/src/feature/tournament/bloc/game_cubit.dart';
import 'package:esports_cuba/src/feature/bookmark/bloc/bookmark_cubit.dart';
import 'package:esports_cuba/src/feature/tournament/bloc/tournament_cubit.dart';

import '../../shared/utils.dart';
import '../../shared/widgets/error_dialog.dart';

class SplashController {
  static Future checkVersion(BuildContext cntxt) async {
    Future<SharedPreferences> preferences = SharedPreferences.getInstance();
    final SharedPreferences prefs = await preferences;
    // String lastVersion = prefs.getString('lastVersion') ?? '';
    ApiResult apiResult =
        await serviceLocator<VersionRepository>().getVersion();
    if (apiResult.error == null) {
      VersionBaseModel versionBaseModel = apiResult.responseObject[0];
      cntxt.read<VersionCubit>().loadVersion(versionBaseModel.versionApp!);

      if (versionBaseModel.versionApp != versionBaseModel.version) {
        if (versionBaseModel.breakingChange) {
          await showDialog(
              context: cntxt,
              barrierDismissible: false,
              builder: (context) {
                return WillPopScope(
                    onWillPop: Utils.exitApp(),
                    child: UpdateDialog(versionBaseModel: versionBaseModel));
              });
        } else {
          checkLogin(context: cntxt, versionBaseModel: versionBaseModel);
        }
      } else {
        //await showUpdateLogic(cntxt, false);
        checkLogin(context: cntxt);
      }
    } else {
      showDialog(
        context: cntxt,
        barrierDismissible: false,
        builder: (_) {
          return WillPopScope(
            onWillPop: Utils.exitApp(),
            child: ErrorDialog(
              errorText: apiResult.message!,
            ),
          );
        },
      );
    }
  }

  static Future<void> checkLogin(
      {required BuildContext context,
      VersionBaseModel? versionBaseModel}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    ApiResult apiResult =
        await serviceLocator<VersionRepository>().getVersion();

    if (apiResult.error == null) {
      _prefs.setString("version", apiResult.responseObject[0].version);
    }

    ///Inicializamos la data
    if (_prefs.getString("token") != null) {
      await getInitialData(context);
      context.read<DrawerCubit>().getUser(context);
      context.router.replace(LayoutScreen(versionBaseModel: versionBaseModel));
    } else {
      context.router.replace(const SignupScreen());
    }
  }

  static getInitialData(BuildContext context) async {
    AppInfo? appInfo = await AppInfo.getInstace(context);

    ///En caso de que se haya cerrado la sesión e ingresado de nuevo a la app se vuelve a inicializar el user
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (appInfo!.user == null) {
      await AppInfo.initUser(prefs);
    }

    ///Cargamos todos los juegos
    context.read<GameCubit>().loadGames();

    ///Cargamos todos los torneos
    context.read<TournamentCubit>().loadTournaments();

    ///Cargamos todos los equipos
    context.read<TeamCubit>().loadTeams();

    ///Cargamos todos los equipos
    context.read<PlayerCubit>().loadPlayers();

    ///Cargamos todos los anuncios
    context.read<NewsCubit>().loadNews();

    if (appInfo.user != null) {
      ///Cargamos la info del drawer
      context.read<DrawerCubit>().getUser(context);

      ///Cargamos todos los elementos guardados
      context.read<BookmarkCubit>().loadBookmarkByUser(appInfo.user!);

      ///Cargamos todos los favoritos
      context.read<FavoritesCubit>().loadFavs(appInfo.user!);
    }
  }
}
