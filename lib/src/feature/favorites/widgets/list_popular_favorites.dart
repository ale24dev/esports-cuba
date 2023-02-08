import 'package:esports_cuba/src/feature/favorites/constants/category_favorites.dart';
import 'package:esports_cuba/src/feature/player/cubit/player_cubit.dart';
import 'package:esports_cuba/src/feature/team/bloc/team_cubit.dart';
import 'package:esports_cuba/src/feature/tournament/bloc/tournament_cubit.dart';
import 'package:esports_cuba/src/models/team_base_model.dart';
import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../constants.dart';
import '../../../../resources/general_styles.dart';
import '../../../models/player_base_model.dart';
import '../../../models/tournament_base_model.dart';
import '../../../shared/utils.dart';
import '../../../shared/widgets/empty_data_message.dart';

class ListPopularFavorites extends StatelessWidget {
  const ListPopularFavorites({
    super.key,
    required this.categorySelected,
  });

  ///Categoría de favoritos seleccionada
  final CategoryFavoritesEnum categorySelected;

  @override
  Widget build(BuildContext context) {
    ///Bandera que indica si el favorito es el primero en su categoría en una lista
    bool isFirst = true;
    List<dynamic> listFavorites = [];

    switch (categorySelected) {
      case CategoryFavoritesEnum.TOURNAMENTS:
        listFavorites = Utils.getPopularTournaments(
            context.read<TournamentCubit>().listTournaments);
        break;

      case CategoryFavoritesEnum.TEAMS:
        listFavorites =
            Utils.getPopularTeams(context.read<TeamCubit>().listTeams);
        break;

      case CategoryFavoritesEnum.PLAYERS:
        listFavorites =
            Utils.getPopularPlayers(context.read<PlayerCubit>().listPlayers);
        break;

      default:
        listFavorites.addAll(Utils.getPopularTournaments(
            context.read<TournamentCubit>().listTournaments));
        listFavorites
            .addAll(Utils.getPopularTeams(context.read<TeamCubit>().listTeams));
        listFavorites.addAll(
            Utils.getPopularPlayers(context.read<PlayerCubit>().listPlayers));
    }
    return Expanded(
        child: listFavorites.isEmpty
            ? EmptyDataMessage(message: context.loc.anyPopulars)
            : ListView.builder(
                shrinkWrap: true,
                itemCount: listFavorites.length,
                itemBuilder: (context, index) {
                  if (categorySelected == CategoryFavoritesEnum.ALL) {
                    if (index != 0 &&
                        listFavorites[index].runtimeType ==
                            listFavorites[index - 1].runtimeType &&
                        isFirst) {
                      isFirst = !isFirst;
                    } else if (index != 0 &&
                        listFavorites[index].runtimeType !=
                            listFavorites[index - 1].runtimeType &&
                        !isFirst) {
                      isFirst = !isFirst;
                    }
                  }
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Constants.MARGIN, vertical: 1.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        index == 0 &&
                                categorySelected != CategoryFavoritesEnum.ALL
                            ? Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Constants.MARGIN / 2),
                                child: Text(
                                  categorySelected ==
                                          CategoryFavoritesEnum.TEAMS
                                      ? context.loc.popularTeams.toUpperCase()
                                      : categorySelected ==
                                              CategoryFavoritesEnum.TOURNAMENTS
                                          ? context.loc.popularTournaments
                                              .toUpperCase()
                                          : context.loc.popularPlayers
                                              .toUpperCase(),
                                  style: context.textTheme.bodyText1
                                      ?.copyWith(color: Colors.grey),
                                ),
                              )
                            : const SizedBox.shrink(),
                        categorySelected == CategoryFavoritesEnum.ALL && isFirst
                            ? Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Constants.MARGIN / 2),
                                child: Text(
                                  listFavorites[index] is TeamBaseModel
                                      ? context.loc.popularTeams.toUpperCase()
                                      : listFavorites[index]
                                              is TournamentBaseModel
                                          ? context.loc.popularTournaments
                                              .toUpperCase()
                                          : context.loc.popularPlayers
                                              .toUpperCase(),
                                  style: context.textTheme.bodyText1
                                      ?.copyWith(color: Colors.grey),
                                ),
                              )
                            : const SizedBox.shrink(),
                        SizedBox(height: 1.h),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Constants.MARGIN),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 28.sp,
                                width: 28.sp,
                                decoration:
                                    const BoxDecoration(shape: BoxShape.circle),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child:
                                      Image.network(listFavorites[index].image),
                                ),
                              ),
                              SizedBox(width: 4.w),
                              Expanded(
                                  child: Text(
                                listFavorites[index] is PlayerBaseModel
                                    ? listFavorites[index].nickname
                                    : listFavorites[index].name,
                                style: context.textTheme.bodyText1,
                                textAlign: TextAlign.start,
                              )),
                              FaIcon(FontAwesomeIcons.solidHeart,
                                  color: GStyles.colorFail, size: 19.sp)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        index != listFavorites.length - 1
                            ? Container(
                                margin: EdgeInsets.symmetric(horizontal: 5.w),
                                child: const Divider(
                                  color: Colors.white10,
                                ))
                            : const SizedBox.shrink()
                      ],
                    ),
                  );
                },
              ));
  }
}
