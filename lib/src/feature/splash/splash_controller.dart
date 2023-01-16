// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:esports_cuba/locator.dart';
import 'package:esports_cuba/src/feature/auth/bloc/auth_cubit.dart';
import 'package:esports_cuba/src/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:esports_cuba/src/feature/news/bloc/news_cubit.dart';
import 'package:esports_cuba/src/feature/tournament/bloc/game_cubit.dart';
import 'package:esports_cuba/src/feature/tournament/bloc/tournament_cubit.dart';

import 'package:esports_cuba/src/route/app_router.gr.dart';

class SplashController {
  static checkLogin(BuildContext context) async {
    //await Future.delayed(const Duration(seconds: 1));
    print("Veamos");
    SharedPreferences _prefs = await SharedPreferences.getInstance();


    ///Inicializamos la data
    getInitialData(context);
    
    print("TOKEN: " + _prefs.getString("token").toString());
    print("USERNAME: " + _prefs.getString("username").toString());
    if (_prefs.getString("token") != null) {
      context.router.replace(const LayoutScreen());
    } else {
      context.router.replace(const SignupScreen());
    }
    //context.router.replace(const RegisterUserScreen());
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
