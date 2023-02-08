import 'package:esports_cuba/resources/general_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../constants.dart';
import '../bloc/tournament_cubit.dart';
import '../../../models/tournament_base_model.dart';
import '../constants/category_tournament_details.dart';
import 'package:esports_cuba/src/shared/extensions.dart';
import '../../../models/team_tournament_base_model.dart';

class TournamentDetailsWidget extends StatelessWidget {
  const TournamentDetailsWidget({
    Key? key,
    required this.tournament,
    required this.listTeamTournaments,
    required this.category,
  }) : super(key: key);

  final List<TeamTournamentBaseModel> listTeamTournaments;

  final TournamentBaseModel tournament;

  final CategoryTournamentDetailsEnum category;

  @override
  Widget build(BuildContext context) {
    switch (category) {
      case CategoryTournamentDetailsEnum.information:
        return Expanded(
            child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: Constants.MARGIN, vertical: 2.h),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: GStyles.containerDarkColor,
                borderRadius: BorderRadius.circular(5.0)),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Constants.MARGIN, vertical: 2.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tournament.description,
                        style: const TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
        ));

      case CategoryTournamentDetailsEnum.participants:
        return Expanded(
            child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: Constants.MARGIN, vertical: 2.h),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: GStyles.containerDarkColor,
                borderRadius: BorderRadius.circular(5.0)),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Constants.MARGIN),
                child: listTeamTournaments.isNotEmpty
                    ? ListView.builder(
                        itemCount: listTeamTournaments.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                color: index % 2 == 0
                                    ? GStyles.backGroundDarkColor
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Padding(
                              padding: EdgeInsets.all(8.sp),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.network(
                                        listTeamTournaments[index]
                                            .team!
                                            .image
                                            .toString(),
                                        height: 30.sp,
                                      ),
                                      SizedBox(width: 1.w),
                                      Text(
                                          listTeamTournaments[index].team!.name,
                                          style: context.textTheme.bodyText1
                                              ?.copyWith(
                                                  fontSize: 16.sp,
                                                  fontFamily: GStyles
                                                      .fontSanFrancisco)),
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon:
                                          const FaIcon(FontAwesomeIcons.heart))
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : Center(
                        child: FittedBox(
                          child: Text(context.loc.emptyParticipants,
                              style: context.textTheme.bodyText1),
                        ),
                      )),
          ),
        ));
      default:
        return Expanded(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Constants.MARGIN, vertical: 2.h),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: GStyles.containerDarkColor,
                  borderRadius: BorderRadius.circular(5.0)),
              child: Center(
                  child: FittedBox(
                      child: Text(context.loc.calendar,
                          style: context.textTheme.bodyText1))),
            ),
          ),
        );
    }
  }
}
