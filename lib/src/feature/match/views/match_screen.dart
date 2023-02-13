import 'package:esports_cuba/constants.dart';
import 'package:esports_cuba/resources/general_styles.dart';
import 'package:esports_cuba/resources/images.dart';
import 'package:esports_cuba/src/feature/roster/bloc/roster_cubit.dart';
import 'package:esports_cuba/src/models/match_base_model.dart';
import 'package:esports_cuba/src/models/player_base_model.dart';
import 'package:esports_cuba/src/models/roster_base_model.dart';
import 'package:esports_cuba/src/models/team_base_model.dart';
import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:esports_cuba/src/shared/loading_app.dart';
import 'package:flutter/material.dart';

import 'package:esports_cuba/src/shared/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../shared/widgets/empty_data_message.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({super.key, required this.match});

  ///Partido a mostrar en la pestaña
  final MatchBaseModel match;

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  ///Roster del equipo local
  late List<RosterBaseModel> rosterTeamLocal;

  ///Roster del equipo local
  late List<RosterBaseModel> rosterTeamVisitant;

  late PlayerBaseModel? playerLocal;

  late PlayerBaseModel? playerVisitant;

  late TeamBaseModel? teamLocal;

  late TeamBaseModel? teamVisitant;

  @override
  void initState() {
    if (!widget.match.tournament.individual) {
      context.read<RosterCubit>().getRosterByTeamTournament(widget.match);
    } else {
      playerLocal = widget.match.playerLocal!;
      playerVisitant = widget.match.playerVisitant!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///Variable que indica so un torneo es individual
    bool isIndividual = widget.match.tournament.individual;

    if (isIndividual) {
      playerLocal = widget.match.playerLocal!;
      playerVisitant = widget.match.playerVisitant!;
    } else {
      teamLocal = widget.match.teamLocal;
      teamVisitant = widget.match.teamVisitant;
    }
    return Scaffold(
      appBar: Utils.appBarWidget(
          context: context,
          navigateBack: true,
          title: widget.match.tournament.name),
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
                  match: widget.match),
              SizedBox(width: Constants.MARGIN + 4.w),
              Column(
                children: [
                  Text("VS", style: context.textTheme.bodyText1),
                  Text(Utils.getHour(widget.match.createdAt).toString(),
                      style: context.textTheme.bodyText1
                          ?.copyWith(color: Colors.grey)),
                ],
              ),
              SizedBox(width: Constants.MARGIN + 4.w),
              imageAndName(
                  context: context,
                  isIndividual: isIndividual,
                  isLocal: false,
                  match: widget.match),
            ],
          ),
          SizedBox(height: 5.h),
          isIndividual
              ? Center(
                  child: Text("Datos individuales",
                      style: context.textTheme.bodyText1))
              : BlocBuilder<RosterCubit, RosterState>(
                  builder: (context, state) {
                    switch (state.runtimeType) {
                      case RosterLoading:
                        return const Expanded(
                            child: Center(child: LoadingApp()));

                      case RosterEmpty:
                        return const Expanded(
                            child: Center(
                                child: EmptyDataMessage(
                          message: "No hay jugadores en este equipo",
                        )));
                      case RosterLoaded:
                      default:
                        return Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  color: Colors.red,
                                  child: Row(children: [
                                    Expanded(
                                      child: Container(
                                        width: 50.w,
                                        margin: EdgeInsets.only(
                                            right: Constants.MARGIN),
                                        child: ListView.builder(
                                            itemCount: (state as RosterLoaded)
                                                .apiResult
                                                .responseObject[0]
                                                .length,
                                            itemBuilder: (_, index) {
                                              RosterBaseModel rosterLocal =
                                                  state.apiResult
                                                      .responseObject[0][index];

                                              return Container(
                                                decoration: BoxDecoration(
                                                    color: GStyles
                                                        .containerDarkColor,
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                            topRight:
                                                                Radius.circular(
                                                                    10.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    10.0))),
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 1.h),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          Constants.MARGIN,
                                                      vertical: 2.h),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                              isIndividual
                                                                  ? playerLocal!
                                                                      .nickname
                                                                  : rosterLocal
                                                                      .player
                                                                      .nickname,
                                                              textAlign:
                                                                  TextAlign
                                                                      .right,
                                                              style: context
                                                                  .textTheme
                                                                  .bodyText1),
                                                          Text(
                                                              isIndividual
                                                                  ? playerLocal!
                                                                      .name
                                                                  : rosterLocal
                                                                      .player
                                                                      .name,
                                                              style: context
                                                                  .textTheme
                                                                  .bodyText1
                                                                  ?.copyWith(
                                                                      color: Colors
                                                                          .grey,
                                                                      fontSize:
                                                                          14.sp)),
                                                        ],
                                                      ),
                                                      SizedBox(width: 10.sp),
                                                      FadeInImage.assetNetwork(
                                                          height: 25.sp,
                                                          width: 25.sp,
                                                          placeholder:
                                                              Images.loadingGif,
                                                          image: isIndividual
                                                              ? playerLocal!
                                                                  .image
                                                              : rosterLocal
                                                                  .player
                                                                  .image),
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
                                        margin: EdgeInsets.only(
                                            left: Constants.MARGIN),
                                        child: ListView.builder(
                                            itemCount: state.apiResult
                                                .responseObject[1].length,
                                            itemBuilder: (_, index) {
                                              RosterBaseModel rosterVisitant =
                                                  state.apiResult
                                                      .responseObject[1][index];
                                              return Container(
                                                decoration: BoxDecoration(
                                                    color: GStyles
                                                        .containerDarkColor,
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    10.0),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    10.0))),
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 1.h),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          Constants.MARGIN,
                                                      vertical: 2.h),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      FadeInImage.assetNetwork(
                                                          height: 25.sp,
                                                          width: 25.sp,
                                                          placeholder:
                                                              Images.loadingGif,
                                                          image: isIndividual
                                                              ? playerVisitant!
                                                                  .image
                                                              : rosterVisitant
                                                                  .player
                                                                  .image),
                                                      SizedBox(width: 10.sp),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              isIndividual
                                                                  ? playerVisitant!
                                                                      .nickname
                                                                  : rosterVisitant
                                                                      .player
                                                                      .nickname,
                                                              textAlign:
                                                                  TextAlign
                                                                      .right,
                                                              style: context
                                                                  .textTheme
                                                                  .bodyText1),
                                                          Text(
                                                              isIndividual
                                                                  ? playerVisitant!
                                                                      .name
                                                                  : rosterVisitant
                                                                      .player
                                                                      .name,
                                                              style: context
                                                                  .textTheme
                                                                  .bodyText1
                                                                  ?.copyWith(
                                                                      color: Colors
                                                                          .grey,
                                                                      fontSize:
                                                                          14.sp)),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                              Container(
                                height: 100,
                                child: Column(
                                  children: [
                                    Text(
                                      "Cara a Cara",
                                      style: context.textTheme.headline3,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FadeInImage.assetNetwork(
                                            height: 32.sp,
                                            placeholder: Images.loadingGif,
                                            image: isIndividual
                                                ? widget
                                                    .match.playerLocal!.image
                                                : widget
                                                    .match.teamLocal!.image),
                                        FadeInImage.assetNetwork(
                                            height: 32.sp,
                                            placeholder: Images.loadingGif,
                                            image: isIndividual
                                                ? widget
                                                    .match.playerVisitant!.image
                                                : widget
                                                    .match.teamVisitant!.image),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                    }
                  },
                ),
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
      width: 35.w,
      child: Column(
        children: [
          FadeInImage.assetNetwork(
              height: 40.sp,
              placeholder: Images.loadingGif,
              image: isIndividual ? player.image : team.image),
          SizedBox(height: 10.sp),
          FittedBox(
            child: Text(isIndividual ? player.nickname : team.name,
                style: context.textTheme.headline3
                    ?.copyWith(fontFamily: GStyles.fontPoppins)),
          ),
        ],
      ),
    );
  }
}
