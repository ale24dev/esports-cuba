import 'package:auto_route/auto_route.dart';
import 'package:esports_cuba/constants.dart';
import 'package:esports_cuba/src/feature/favorites/bloc/favorites/favorites_cubit.dart';
import 'package:esports_cuba/src/shared/widgets/empty_data_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:esports_cuba/src/shared/loading_app.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:esports_cuba/src/shared/utils.dart';
import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:esports_cuba/resources/general_styles.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';
import 'package:esports_cuba/src/models/tournament_base_model.dart';
import 'package:esports_cuba/src/feature/tournament/bloc/tournament_cubit.dart';

import '../../../route/app_router.gr.dart';

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
              ? const LoadingApp()
              //  : SizedBox();
              : state is TournamentEmpty?
                  ? EmptyDataMessage(message: context.loc.emptyTournaments)
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

  Widget tournamentCard(
      TournamentBaseModel tournament, BuildContext context, int index) {
    return InkWell(
      onTap: () {
        context.router.push(TournamentDetails(tournamentBaseModel: tournament));
      },
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: GStyles.containerDarkColor,
              ),
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
      ),
    );
  }

  Widget imageCard(TournamentBaseModel tournament) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(
            tournament.imageHeader,
            height: 20.h,
            width: 95.w,
            fit: BoxFit.cover,
          ),
        ),
        BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            bool equalElement = Utils.checkFavoriteInList(
                dynamic: tournament,
                listBaseModel: context.read<FavoritesCubit>().listLocalFavs);
            return state is FavoritesLoading
                ? const LoadingApp()
                : Positioned(
                    top: 1.h,
                    right: 2.w,
                    child: GestureDetector(
                      onTap: () {
                        if (equalElement) {
                          context
                              .read<FavoritesCubit>()
                              .removeLocalFavoriteToUser(tournament, context);
                        } else {
                          context
                              .read<FavoritesCubit>()
                              .addLocalFavoriteToUser(tournament, context);
                        }
                      },
                      child: Container(
                        height: 24.sp,
                        width: 24.sp,
                        decoration: BoxDecoration(
                            color: GStyles.backGroundDarkColor,
                            shape: BoxShape.circle),
                        child: Center(
                          child: FaIcon(
                              equalElement
                                  ? FontAwesomeIcons.solidHeart
                                  : FontAwesomeIcons.heart,
                              color: GStyles.colorPrimary,
                              size: 17.sp),
                        ),
                      ),
                    ));
          },
        )
      ],
    );
  }

  Container nameAndEdition(
      TournamentBaseModel tournament, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Text("${tournament.name} #${tournament.edition}",
            style: context.textTheme.bodyText1?.copyWith(fontSize: 17.sp)),
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
              style: context.textTheme.bodyText1
                  ?.copyWith(fontSize: 14.sp, color: Colors.grey)),
          SizedBox(width: 2.w),
          FaIcon(FontAwesomeIcons.clock,
              color: GStyles.colorPrimary, size: 18.sp),
          SizedBox(width: 1.5.w),
          Text(Utils.getHour(tournament.createdAt).toString(),
              style: context.textTheme.bodyText1
                  ?.copyWith(fontSize: 14.sp, color: Colors.grey)),
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
                    style: context.textTheme.bodyText1
                        ?.copyWith(fontSize: 14.sp, color: Colors.grey)),
                Container(
                  decoration: BoxDecoration(
                      color: Utils.getColorByTournamentState(tournament),
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Padding(
                    padding: EdgeInsets.all(12.sp),
                    child: Text(
                      Utils.getNameStateByLocale(
                              context, tournament.tournamentState!)
                          .toUpperCase(),
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodyText1
                          ?.copyWith(fontSize: 14.sp, color: Colors.white),
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
