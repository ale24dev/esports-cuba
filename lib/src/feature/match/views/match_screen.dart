import 'package:esports_cuba/constants.dart';
import 'package:esports_cuba/resources/general_styles.dart';
import 'package:esports_cuba/resources/images.dart';
import 'package:esports_cuba/src/models/match_base_model.dart';
import 'package:esports_cuba/src/models/player_base_model.dart';
import 'package:esports_cuba/src/models/team_base_model.dart';
import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:flutter/material.dart';

import 'package:esports_cuba/src/shared/utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({super.key, required this.match});

  ///Partido a mostrar en la pestaña
  final MatchBaseModel match;

  @override
  Widget build(BuildContext context) {
    print("Etnter");
    print(match.toString());

    ///Variable que indica so un torneo es individual
    bool isIndividual = match.tournament.individual;

    late TeamBaseModel? teamLocal;
    late TeamBaseModel? teamVisitant;
    late PlayerBaseModel? playerLocal;
    late PlayerBaseModel? playerVisitant;

    if (isIndividual) {
      playerLocal = match.playerLocal!;
      playerVisitant = match.playerVisitant!;
    } else {
      teamLocal = match.teamLocal;
      teamVisitant = match.teamVisitant;
    }
    return Scaffold(
      appBar: Utils.appBarWidget(
          context: context, navigateBack: true, title: match.tournament.name),
      body: Column(
        children: [
          SizedBox(height: 2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              imageAndName(
                  context: context,
                  isIndividual: isIndividual,
                  isLocal: true,
                  match: match),
              SizedBox(width: Constants.MARGIN + 4.w),
              Text("VS", style: context.textTheme.bodyText1),
              SizedBox(width: Constants.MARGIN + 4.w),
              imageAndName(
                  context: context,
                  isIndividual: isIndividual,
                  isLocal: false,
                  match: match),
            ],
          ),
          SizedBox(height: 5.h),
          Expanded(
              child: Row(children: [
            Expanded(
              child: Container(
                width: 50.w,
                margin: EdgeInsets.only(right: Constants.MARGIN),
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (_, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: GStyles.containerDarkColor,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0))),
                        margin: EdgeInsets.symmetric(vertical: 1.h),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Constants.MARGIN, vertical: 2.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("vk_ale24",
                                      textAlign: TextAlign.right,
                                      style: context.textTheme.bodyText1),
                                  Text("Alejandro Díaz",
                                      style: context.textTheme.bodyText1
                                          ?.copyWith(
                                              color: Colors.grey,
                                              fontSize: 14.sp)),
                                ],
                              ),
                              SizedBox(width: 10.sp),
                              Container(
                                height: 25.sp,
                                width: 25.sp,
                                decoration: BoxDecoration(
                                    color: GStyles.colorPrimary,
                                    shape: BoxShape.circle),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Expanded(
              child: Container(
                width: 50.w,
                margin: EdgeInsets.only(left: Constants.MARGIN),
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (_, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: GStyles.containerDarkColor,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0))),
                        margin: EdgeInsets.symmetric(vertical: 1.h),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Constants.MARGIN, vertical: 2.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("vk_ale24",
                                      textAlign: TextAlign.right,
                                      style: context.textTheme.bodyText1),
                                  Text("Alejandro Díaz",
                                      style: context.textTheme.bodyText1
                                          ?.copyWith(
                                              color: Colors.grey,
                                              fontSize: 14.sp)),
                                ],
                              ),
                              SizedBox(width: 10.sp),
                              Container(
                                height: 25.sp,
                                width: 25.sp,
                                decoration: BoxDecoration(
                                    color: GStyles.colorPrimary,
                                    shape: BoxShape.circle),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ])),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }

  Widget imageAndName(
      {required bool isIndividual,
      required BuildContext context,
      required MatchBaseModel match,
      required bool isLocal}) {
    late TeamBaseModel team;
    late PlayerBaseModel player;

    if (isIndividual) {
      if (isLocal) {
        player = match.playerLocal!;
      } else {
        player = match.playerVisitant!;
      }
    } else {
      if (isLocal) {
        team = match.teamLocal!;
      } else {
        team = match.teamVisitant!;
      }
    }
    return SizedBox(
      width: 30.w,
      child: Column(
        children: [
          FadeInImage.assetNetwork(
              height: 40.sp,
              placeholder: Images.loadingGif,
              image: isIndividual ? player.image : team.image),
          SizedBox(height: 10.sp),
          Text(isIndividual ? player.nickname : team.name,
              style: context.textTheme.bodyText1),
        ],
      ),
    );
  }
}
