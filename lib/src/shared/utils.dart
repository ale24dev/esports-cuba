// ignore_for_file: unrelated_type_equality_checks

import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:esports_cuba/resources/general_styles.dart';
import 'package:esports_cuba/src/models/tournament_base_model.dart';
import 'package:esports_cuba/src/models/tournament_state_base_model.dart';

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
}
