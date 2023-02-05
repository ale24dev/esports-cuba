// ignore_for_file: unrelated_type_equality_checks

import 'dart:io';

import 'package:esports_cuba/src/feature/bookmark/views/widgets/bookmark_card.dart';
import 'package:esports_cuba/src/models/bookmark_base_model.dart';
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

import '../models/news_base_model.dart';
import '../route/app_router.gr.dart';

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
    return DateFormat.yMd().format(date);
  }

  ///Obtener la hora de un DateTime
  static getHour(DateTime date) {
    return DateFormat.jm('es').format(date);
  }

  static dynamic getColorByTournamentState(TournamentBaseModel tournament) {
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
      leading: navigateBack
          ? InkWell(
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
            )
          : null,
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
      {required List<NewsBaseModel> listNewsbaseModel,
      required NewsBaseModel newBaseModel}) {
    for (var newsBaseModel in listNewsbaseModel) {
      if (newsBaseModel.id == newBaseModel.id) {
        return true;
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
      Duration? duration}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(bottom: 2.h, left: 3.w, right: 3.w),
      content: Text(text),
      backgroundColor: GStyles.colorPrimary,
      duration: duration ?? const Duration(seconds: 5),
    ));
  }
}
