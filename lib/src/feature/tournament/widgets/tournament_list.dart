import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:esports_cuba/src/shared/utils.dart';
import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:esports_cuba/resources/general_styles.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';
import 'package:esports_cuba/src/models/tournament_base_model.dart';
import 'package:esports_cuba/src/feature/tournament/bloc/tournament_cubit.dart';

class TournamentList extends StatelessWidget {
  late ApiResult apiResult;

  TournamentList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<TournamentCubit, TournamentState>(
        builder: (context, state) {
          if (state is TournamentLoaded) {
            apiResult = state.apiResult;
          }
          return state is TournamentLoading
              ? Center(
                  child: SpinKitFadingCube(
                  color: Colors.white,
                  size: 20.sp,
                ))
              //  : SizedBox();
              : apiResult.responseObject.length == 0
                  ? Center(
                      child: Text(context.loc.emptyTournaments,
                          style: context.textTheme.headline4),
                    )
                  : ListView.builder(
                      itemCount: apiResult.responseObject.length,
                      itemBuilder: ((context, index) {
                        TournamentBaseModel tournament =
                            apiResult.responseObject[index];
                        return tournamentCard(tournament, context, index);
                      }));
        },
      ),
    );
  }

  Column tournamentCard(
      TournamentBaseModel tournament, BuildContext context, int index) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: GStyles.backGroundDarkColor,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26, blurRadius: 1, spreadRadius: 1)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                imageCard(tournament),
                nameAndEdition(tournament, context),
                dateAndTime(tournament, context),
                SizedBox(height: 1.h),
                prizepoolAndState(tournament, context),
                SizedBox(height: 1.h),
              ],
            ),
          ),
        ),
        index != apiResult.responseObject.length - 1
            ? Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                child: const Divider(
                  color: Colors.white10,
                ))
            : const SizedBox.shrink()
      ],
    );
  }

  ClipRRect imageCard(TournamentBaseModel tournament) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.network(
        tournament.imageHeader,
        height: 20.h,
        width: 95.w,
        fit: BoxFit.cover,
      ),
    );
  }

  Container nameAndEdition(
      TournamentBaseModel tournament, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Text("${tournament.name} #${tournament.edition}",
            style: context.textTheme.bodyText1?.copyWith(fontSize: 24)),
      ),
    );
  }

  Padding dateAndTime(TournamentBaseModel tournament, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Row(
        children: [
          FaIcon(FontAwesomeIcons.calendar,
              color: GStyles.colorPrimary, size: 18.sp),
          SizedBox(width: 1.5.w),
          Text(Utils.getDate(tournament.createdAt).toString(),
              style: context.textTheme.bodyText1),
          SizedBox(width: 2.w),
          FaIcon(FontAwesomeIcons.clock,
              color: GStyles.colorPrimary, size: 18.sp),
          SizedBox(width: 1.5.w),
          Text(Utils.getHour(tournament.createdAt).toString(),
              style: context.textTheme.bodyText1),
        ],
      ),
    );
  }

  Padding prizepoolAndState(
      TournamentBaseModel tournament, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Row(
        children: [
          FaIcon(FontAwesomeIcons.moneyCheckDollar,
              color: GStyles.colorPrimary, size: 18.sp),
          SizedBox(width: 1.5.w),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    tournament.prizepool == null
                        ? "\$" "0"
                        : "\$${tournament.prizepool}",
                    style: context.textTheme.bodyText1),
                Container(
                  decoration: BoxDecoration(
                      color: Utils.getColorByTournamentState(tournament),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Text(
                      Utils.getNameStateByLocale(
                          context, tournament.tournamentState),
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodyText1
                          ?.copyWith(fontSize: 18.sp, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
