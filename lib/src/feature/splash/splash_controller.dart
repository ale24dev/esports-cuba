// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:esports_cuba/src/feature/news/bloc/news_cubit.dart';
import 'package:esports_cuba/src/feature/tournament/bloc/game_cubit.dart';
import 'package:esports_cuba/src/feature/tournament/bloc/tournament_cubit.dart';

import 'package:esports_cuba/src/route/app_router.gr.dart';

class SplashController {
  static checkLogin(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));

    context.router.replace(const SignupScreen());
    //context.router.replace(const RegisterUserScreen());

    ///Inicializamos la data
    getInitialData(context);
  }

  static getInitialData(BuildContext context) {
    ///Cargamos todos los juegos
    context.read<GameCubit>().loadGames();

    ///Cargamos todos los torneos
    context.read<TournamentCubit>().loadTournaments();

    ///Cargamos todos los anuncios
    context.read<NewsCubit>().loadNews();
  }
}
