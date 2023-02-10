import 'package:esports_cuba/resources/general_styles.dart';
import 'package:esports_cuba/src/feature/favorites/bloc/favorites/favorites_cubit.dart';
import 'package:esports_cuba/src/models/team_base_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../constants.dart';
import '../../../../resources/images.dart';
import '../../../shared/loading_app.dart';
import '../../../shared/utils.dart';
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
                        style: const TextStyle(color: Colors.white60)),
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
                padding: EdgeInsets.symmetric(
                    horizontal: Constants.MARGIN, vertical: 1.h),
                child: listTeamTournaments.isNotEmpty
                    ? ListView.builder(
                        itemCount: listTeamTournaments.length,
                        itemBuilder: (context, index) {
                          TeamBaseModel team = listTeamTournaments[index].team!;
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Constants.MARGIN),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 28.sp,
                                      width: 28.sp,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: FadeInImage.assetNetwork(
                                          placeholder: Images.loadingGif,
                                          image: team.image,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 4.w),
                                    Expanded(
                                        child: Text(
                                      team.name,
                                      style: context.textTheme.bodyText1,
                                      textAlign: TextAlign.start,
                                    )),
                                    BlocBuilder<FavoritesCubit, FavoritesState>(
                                      builder: (context, state) {
                                        bool equalElement =
                                            Utils.checkFavoriteInList(
                                                dynamic: team,
                                                listBaseModel: context
                                                    .read<FavoritesCubit>()
                                                    .listLocalFavs);
                                        return state is FavoritesLoading
                                            ? const LoadingApp()
                                            : GestureDetector(
                                                onTap: () {
                                                  if (equalElement) {
                                                    context
                                                        .read<FavoritesCubit>()
                                                        .removeLocalFavoriteToUser(
                                                            team, context);
                                                  } else {
                                                    context
                                                        .read<FavoritesCubit>()
                                                        .addLocalFavoriteToUser(
                                                            team, context);
                                                  }
                                                },
                                                child: Container(
                                                  color: Colors.transparent,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: FaIcon(
                                                        equalElement
                                                            ? FontAwesomeIcons
                                                                .solidHeart
                                                            : FontAwesomeIcons
                                                                .heart,
                                                        color: GStyles
                                                            .colorPrimary,
                                                        size: 19.sp),
                                                  ),
                                                ),
                                              );
                                      },
                                    )
                                  ],
                                ),
                              ),
                              index != listTeamTournaments.length - 1
                                  ? Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5.w),
                                      child: const Divider(
                                        color: Colors.white10,
                                      ))
                                  : const SizedBox.shrink()
                            ],
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
            padding: EdgeInsets.symmetric(
                horizontal: Constants.MARGIN, vertical: 2.h),
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
