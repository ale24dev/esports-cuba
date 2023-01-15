// ignore_for_file: unrelated_type_equality_checks

import 'package:esports_cuba/src/shared/widgets/dialog_message.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:translator/translator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:esports_cuba/resources/general_styles.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';
import 'package:esports_cuba/src/models/tournament_base_model.dart';
import 'package:esports_cuba/src/shared/widgets/generic_button.dart';
import 'package:esports_cuba/src/models/tournament_state_base_model.dart';

import '../route/app_router.gr.dart';

abstract class Utils {
  ///Parsear un timestamp
  static DateTime parseDate(dynamic timestamp) {
    return DateTime.parse(timestamp);
  }

  static getDate(DateTime date) {
    return DateFormat.yMd().format(date);
  }

  static getHour(DateTime date) {
    return DateFormat.jm('es').format(date);
  }

  static dynamic getColorByTournamentState(TournamentBaseModel tournament) {
    if (tournament.tournamentState.state == "open") {
      return GStyles.colorSuccess;
    } else if (tournament.tournamentState.state == "closed") {
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
                child: IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: (() {
                    context.router.push(const FavoritesScreen());
                  }),
                ))
          ],
    );
  }

  ///Widget encargado de mostrar la data interna en el ApiResult
  static Future<Widget> apiResultShow(
      {required BuildContext context, required ApiResult apiResult}) async {
    late String title;
    switch (apiResult.error.runtimeType) {
      case AuthException:
        title = context.loc.authError;
        break;

      default:
        title = context.loc.unexpectedError;
    }
    return apiResult.error != null
        ? DialogMessage(
            title: title, text: apiResult.error.message, withTranslate: true)
        : const SizedBox.shrink();
  }
}
