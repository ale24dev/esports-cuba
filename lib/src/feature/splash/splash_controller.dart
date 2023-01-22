// ignore_for_file: use_build_context_synchronously

import 'package:esports_cuba/src/feature/bookmark/bloc/bookmark_cubit.dart';
import 'package:esports_cuba/src/feature/drawer/cubit/drawer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:esports_cuba/locator.dart';
import 'package:esports_cuba/src/shared/app_info.dart';
import 'package:esports_cuba/src/route/app_router.gr.dart';
import 'package:esports_cuba/src/feature/news/bloc/news_cubit.dart';
import 'package:esports_cuba/src/repositories/version_repository.dart';
import 'package:esports_cuba/src/feature/tournament/bloc/game_cubit.dart';
import 'package:esports_cuba/src/feature/tournament/bloc/tournament_cubit.dart';

class SplashController {
  static checkLogin(BuildContext context) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    await serviceLocator<VersionRepository>().getVersion();

    ///Inicializamos la data
    if (_prefs.getString("token") != null) {
      await getInitialData(context);
      context.read<DrawerCubit>().getUser(context);
      context.router.replace(const LayoutScreen());
    } else {
      context.router.replace(const SignupScreen());
    }
  }

  static getInitialData(BuildContext context) async {
    AppInfo? appInfo = await AppInfo.getInstace(context);

    ///Cargamos todos los juegos
    context.read<GameCubit>().loadGames();

    ///Cargamos todos los torneos
    context.read<TournamentCubit>().loadTournaments();

    ///Cargamos todos los anuncios
    context.read<NewsCubit>().loadNews();

    ///Cargamos todos los anuncios
    context.read<BookmarkCubit>().loadBookmarkByUser(appInfo!.user!);

    ///Cargamos la info del drawer
    context.read<DrawerCubit>().getUser(context);
  }
}
