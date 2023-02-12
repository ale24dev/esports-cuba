// ignore_for_file: unrelated_type_equality_checks

import 'dart:io';

import 'package:esports_cuba/src/feature/bookmark/widgets/bookmark_card.dart';
import 'package:esports_cuba/src/models/bookmark_base_model.dart';
import 'package:esports_cuba/src/models/team_base_model.dart';
import 'package:esports_cuba/src/shared/app_info.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:esports_cuba/resources/general_styles.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';
import 'package:esports_cuba/src/models/tournament_base_model.dart';
import 'package:esports_cuba/src/shared/widgets/dialog_message.dart';
import 'package:esports_cuba/src/models/tournament_state_base_model.dart';

import '../feature/tournament/constants/tournament_state_type.dart';
import '../feature/tournament/widgets/category_stage.dart';
import '../models/match_base_model.dart';
import '../models/news_base_model.dart';
import '../models/player_base_model.dart';

abstract class Utils {
  ///Parsear un timestamp
  static DateTime parseDate(dynamic timestamp) {
    return DateTime.parse(timestamp);
  }

  ///Parsear un dateTime a timestamp
  static String parseDateToTimestamp(DateTime dateTime) {
    return dateTime.toIso8601String();
  }

  ///Obtener la fecha de un DateTime
  static getDate(DateTime date) {
    String dateSlug =
        "${date.day.toString()}/${date.month.toString().padLeft(2, '0')}/${date.year.toString().padLeft(2, '0')}";
    //return DateFormat.yMd().format(date);
    return dateSlug;
  }

  ///Obtener la hora de un DateTime
  static getHour(DateTime date) {
    return DateFormat.jm('es').format(date);
  }

  ///Obtener el dia de la semana de un DateTime
  static getWeekDay(BuildContext context, DateTime date) {
    if (context.currentLanguage == "es") {
      switch (DateFormat('EEEE').format(date)) {
        case "Monday":
          return "Lunes";
        case "Tuesday":
          return "Martes";
        case "Wednesday":
          return "Miércoles";
        case "Thursday":
          return "Jueves";
        case "Friday":
          return "Viernes";
        case "Saturday":
          return "Sábado";

        default:
          return "Domingo";
      }
    }
    return DateFormat('EEEE').format(date);
  }

  static Color getColorByTournamentState(TournamentBaseModel tournament) {
    if (tournament.tournamentState!.state == "open") {
      return GStyles.colorSuccess;
    } else if (tournament.tournamentState!.state == "closed") {
      return GStyles.colorInProgress;
    } else {
      return GStyles.colorFail;
    }
  }

  static String getNameStateByLocale(
      BuildContext context, TournamentStateBaseModel tournamentState) {
    if (tournamentState.state == "open") {
      return context.loc.open;
    } else if (tournamentState.state == "closed") {
      return context.loc.closed;
    } else {
      return context.loc.finished;
    }
  }

  static List<String> getStageTournament(int totalTeamsByTournament) {
    List<String> listStages = ["1/4 Final", "Semifinal", "Final"];

    switch (totalTeamsByTournament) {
      case 16:
        listStages.insert(0, "1/8 Final");

        break;
      case 32:
        listStages.insert(0, "1/8 Final");
        listStages.insert(0, "1/16 Final");
        break;
    }

    return listStages;
  }

  static AppBar appBarWidget(
      {required BuildContext context,
      required bool navigateBack,
      String? title,
      List<Widget>? actions,
      Function? callback}) {
    return AppBar(
      title: Center(
          child: Text(title ?? context.loc.appTitle,
              style: context.textTheme.headline4?.copyWith(
                  fontFamily: GStyles.fontEvilEmpire, fontSize: 18.sp))),
      leading: !navigateBack
          ? null
          : InkWell(
              highlightColor: GStyles.containerDarkColor,
              customBorder: const CircleBorder(),
              onTap: (() {
                context.router.pop();
              }),
              child: Center(
                  child: FaIcon(
                FontAwesomeIcons.arrowLeft,
                size: 17.sp,
              )),
            ),
      actions: actions ??
          [
            Padding(
                padding: EdgeInsets.only(right: 2.w),
                child: Container(
                  width: 5.w,
                  color: Colors.transparent,
                  //margin: EdgeInsets.only(right: 5.w)
                ))
          ],
    );
  }

  ///Widget encargado de mostrar la data interna en el ApiResult
  static Future<Widget> apiResultShowError(
      {required BuildContext context, required ApiResult apiResult}) async {
    late String title;
    switch (apiResult.error.runtimeType) {
      case AuthException:
        title = context.loc.authError;
        break;

      case PostgrestException:
        title = context.loc.serverError;
        break;

      default:
        title = context.loc.unexpectedError;
    }
    return DialogMessage(
        title: title, text: apiResult.error.message, withTranslate: true);
  }

  static Future<SharedPreferences> sharedPreferencesInstance() async {
    SharedPreferences? sharedPreferences;

    return sharedPreferences ??= await SharedPreferences.getInstance();
  }

  ///Funcion para validar un email
  static bool isEmailValid(String email) {
    final RegExp regex = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return regex.hasMatch(email);
  }

  ///Funcion para validar un email
  static bool isContainEmojis(String username) {
    RegExp emoji = RegExp(r'[\uD800-\uDBFF][\uDC00-\uDFFF]');
    return emoji.hasMatch(username);
  }

  /// Metodo para cerrar sesion
  static void logOut(BuildContext context) async {
    AppInfo? appInfo = await AppInfo.getInstace(context);

    appInfo?.removeToken();
    appInfo?.setUser(null);
  }

  ///Chequea si una noticia esta en los bookmarks del usuario
  static bool checkBookmarkInListNews(
      {required List<NewsBaseModel> listNewsBaseModel,
      required NewsBaseModel newBaseModel}) {
    for (var newsBaseModel in listNewsBaseModel) {
      if (newsBaseModel.id == newBaseModel.id) {
        return true;
      }
    }
    return false;
  }

  ///Chequea si un elemento esta en la lista de favoritos
  static bool checkFavoriteInList(
      {required List<dynamic> listBaseModel, required dynamic dynamic}) {
    for (var dynamicBaseModel in listBaseModel) {
      if (dynamicBaseModel.runtimeType == dynamic.runtimeType) {
        if (dynamicBaseModel.id == dynamic.id) {
          return true;
        }
      }
    }
    return false;
  }

  static Future<bool> Function()? exitApp() => () async {
        if (Platform.isAndroid) {
          SystemNavigator.pop();
        } else if (Platform.isIOS) {
          exit(0);
        }
        return false;
      };

  ///SnackBar genérico
  static void genericSnackBar(
      {required BuildContext context,
      required String text,
      Duration? duration,
      Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(bottom: 1.h, left: 3.w, right: 3.w),
      content: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      backgroundColor: color ?? GStyles.colorPrimary,
      duration: duration ?? const Duration(seconds: 3),
    ));
  }

  ///Método para obtener los torneos populares
  static List<TournamentBaseModel> getPopularTournaments(
      List<TournamentBaseModel> listTournamentsBaseModel) {
    List<TournamentBaseModel> listPopularTournaments = [];

    for (var tournament in listTournamentsBaseModel) {
      if (tournament.popular) {
        listPopularTournaments.add(tournament);
      }
    }
    return listPopularTournaments;
  }

  ///Método para obtener los equipos populares
  static List<TeamBaseModel> getPopularTeams(
      List<TeamBaseModel> listTeamsBaseModel) {
    List<TeamBaseModel> listPopularTeams = [];

    for (var team in listTeamsBaseModel) {
      if (team.popular) {
        listPopularTeams.add(team);
      }
    }
    return listPopularTeams;
  }

  ///Método para obtener los jugadores populares
  static List<PlayerBaseModel> getPopularPlayers(
      List<PlayerBaseModel> listPlayersBaseModel) {
    List<PlayerBaseModel> listPopularPlayers = [];

    for (var player in listPlayersBaseModel) {
      if (player.popular) {
        listPopularPlayers.add(player);
      }
    }
    return listPopularPlayers;
  }

  static List<TournamentBaseModel> getTournamentsByEnum(
      List<TournamentBaseModel> listTournaments,
      TournamentStateType tournamentType) {
    List<TournamentBaseModel> listTournamentResult = [];
    for (var tournament in listTournaments) {
      switch (tournamentType) {
        case TournamentStateType.open:
          if (tournament.tournamentState!.state == "open") {
            listTournamentResult.add(tournament);
          }
          break;
        case TournamentStateType.closed:
          if (tournament.tournamentState!.state == "closed") {
            listTournamentResult.add(tournament);
          }

          break;
        case TournamentStateType.progress:
          if (tournament.tournamentState!.state == "in_progress") {
            listTournamentResult.add(tournament);
          }
          break;

        case TournamentStateType.finished:
          if (tournament.tournamentState!.state == "finished") {
            listTournamentResult.add(tournament);
          }

          break;

        default:
          break;
      }
    }
    return listTournamentResult;
  }
}
