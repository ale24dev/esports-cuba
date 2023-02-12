import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../route/app_router.gr.dart';
import '../../../shared/utils.dart';
import '../../../../constants.dart';
import '../../../../resources/images.dart';
import '../../../models/team_base_model.dart';
import '../../../models/match_base_model.dart';
import '../../../../resources/general_styles.dart';
import 'package:esports_cuba/src/shared/extensions.dart';

class CalendarCard extends StatelessWidget {
  const CalendarCard({
    super.key,
    required this.teamLocal,
    required this.teamVisitant,
    required this.match,
  });

  final TeamBaseModel teamLocal;
  final TeamBaseModel teamVisitant;
  final MatchBaseModel match;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.replace(MatchScreen(match: match));
      },
      child: Container(
        decoration: BoxDecoration(
            color: GStyles.containerDarkColor,
            borderRadius: BorderRadius.circular(3.0)),
        margin:
            EdgeInsets.symmetric(vertical: 1.h, horizontal: Constants.MARGIN),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 25.sp,
                        width: 25.sp,
                        child: FadeInImage.assetNetwork(
                            height: 25.sp,
                            placeholder: Images.loadingGif,
                            image: teamLocal.image),
                      ),
                      SizedBox(
                        width: 26.w,
                        child: Text(teamLocal.name,
                            style: context.textTheme.bodyText1),
                      ),
                    ],
                  ),
                  Text("VS",
                      style: context.textTheme.bodyText1?.copyWith(
                          color: GStyles.colorPrimary,
                          fontFamily: GStyles.fontEvilEmpire)),
                  Row(
                    children: [
                      SizedBox(
                        width: 26.w,
                        child: Text(teamVisitant.name,
                            textAlign: TextAlign.right,
                            style: context.textTheme.bodyText1),
                      ),
                      SizedBox(
                        height: 25.sp,
                        width: 25.sp,
                        child: FadeInImage.assetNetwork(
                            height: 25.sp,
                            imageErrorBuilder: (context, error, stackTrace) {
                              return const SizedBox(
                                  child: Text("Error loading"));
                            },
                            placeholder: Images.loadingGif,
                            image: teamVisitant.image),
                      ),
                    ],
                  ),
                ],
              ),
              Text(Utils.getHour(match.createdAt!),
                  style: context.textTheme.bodyText1
                      ?.copyWith(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
