import 'package:esports_cuba/src/feature/tournament/bloc/tournament_details/tournament_details_cubit.dart';
import 'package:esports_cuba/src/models/team_tournament_base_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../constants.dart';
import '../../../shared/utils.dart';
import '../../../shared/loading_app.dart';
import '../../match/bloc/match_cubit.dart';
import '../../../../resources/images.dart';
import '../../../models/match_base_model.dart';
import '../../../models/team_base_model.dart';
import '../../../shared/repository/ApiResult.dart';
import '../../../../resources/general_styles.dart';
import '../../../shared/widgets/empty_data_message.dart';
import 'package:esports_cuba/src/shared/extensions.dart';

import 'calendar_card.dart';
import 'category_stage.dart';

class CalendarSection extends StatefulWidget {
  const CalendarSection({super.key});

  @override
  State<CalendarSection> createState() => _CalendarSectionState();
}

class _CalendarSectionState extends State<CalendarSection> {
  late ApiResult apiResult;

  @override
  Widget build(BuildContext context) {
    ///Bandera para saber si un partido tiene una misma fecha que el anterior
    bool isSameDay = false;

    return BlocBuilder<MatchCubit, MatchState>(
      builder: (context, state) {
        if (state is MatchLoaded) {
          apiResult = state.apiResult;
        }

        return state is MatchEmpty
            ? Expanded(
                child: EmptyDataMessage(message: context.loc.calendar),
              )
            : state is MatchLoading
                ? const Expanded(child: LoadingApp())
                : state is MatchLoaded
                    ? Expanded(
                        child: Column(
                          children: [
                            CategoryStage(),
                            Expanded(
                                child: ListView.builder(
                                    itemCount: apiResult.responseObject.length,
                                    itemBuilder: (context, index) {
                                      MatchBaseModel match =
                                          apiResult.responseObject[index];
                                      TeamBaseModel teamLocal =
                                          match.teamLocal!;
                                      TeamBaseModel teamVisitant =
                                          match.teamVisitant!;
                                      if (index != 0) {
                                        if (apiResult
                                                .responseObject[index].createdAt
                                                .difference(apiResult
                                                    .responseObject[index - 1]
                                                    .createdAt)
                                                .inDays ==
                                            0) {
                                          isSameDay = true;
                                        } else {
                                          isSameDay = false;
                                        }
                                      }

                                      return Column(
                                        children: [
                                          SizedBox(height: 1.h),
                                          !isSameDay
                                              ? Text(
                                                  Utils.getDate(
                                                      match.createdAt!),
                                                  style: context
                                                      .textTheme.bodyText1)
                                              : const SizedBox.shrink(),
                                          CalendarCard(
                                              teamLocal: teamLocal,
                                              teamVisitant: teamVisitant,
                                              match: match),
                                        ],
                                      );
                                    })),
                          ],
                        ),
                      )
                    : state is MatchError
                        ? EmptyDataMessage(message: apiResult.message!)
                        : EmptyDataMessage(
                            message: context.loc.unexpectedError);
      },
    );
  }
}