import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/image_section_header.dart';
import '../widgets/tournament_details_widget.dart';
import '../constants/category_tournament_details.dart';
import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:esports_cuba/src/shared/loading_app.dart';
import '../widgets/category_tournament_details_card.dart';
import '../bloc/tournament_details/tournament_details_cubit.dart';
import 'package:esports_cuba/src/models/tournament_base_model.dart';

class TournamentDetails extends StatefulWidget {
  final TournamentBaseModel tournamentBaseModel;

  const TournamentDetails({super.key, required this.tournamentBaseModel});

  @override
  State<TournamentDetails> createState() => _TournamentDetailsState();
}

class _TournamentDetailsState extends State<TournamentDetails> {
  final double HEADER_TOURNAMENT_IMAGE = 24.h;

  CategoryTournamentDetailsEnum categorySelected =
      CategoryTournamentDetailsEnum.information;

  voidCallback(CategoryTournamentDetailsEnum categorySelected) {
    setState(() {
      this.categorySelected = categorySelected;
    });
  }

  @override
  void initState() {
    context
        .read<TournamentDetailsCubit>()
        .getTeamsByTournament(widget.tournamentBaseModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ImageHeaderSection(
              HEADER_TOURNAMENT_IMAGE: HEADER_TOURNAMENT_IMAGE,
              tournament: widget.tournamentBaseModel),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            CategoryTournamentDetailsCard(
              title: context.loc.information,
              category: CategoryTournamentDetailsEnum.information,
              selected:
                  CategoryTournamentDetailsEnum.information == categorySelected,
              callback: voidCallback,
            ),
            CategoryTournamentDetailsCard(
              title: context.loc.participants,
              category: CategoryTournamentDetailsEnum.participants,
              selected: CategoryTournamentDetailsEnum.participants ==
                  categorySelected,
              callback: voidCallback,
            ),
            CategoryTournamentDetailsCard(
              title: context.loc.calendar,
              category: CategoryTournamentDetailsEnum.calendar,
              selected:
                  CategoryTournamentDetailsEnum.calendar == categorySelected,
              callback: voidCallback,
            ),
          ]),
          BlocBuilder<TournamentDetailsCubit, TournamentDetailsState>(
            builder: (context, state) {
              if (state is TournamentDetailsLoading) {
                return const LoadingApp();
              } else if (state is TournamentDetailsError) {
                return Center(
                    child: Text(state.apiResult.message.toString(),
                        style: context.textTheme.bodyText1));
              } else if (state is TournamentDetailsEmpty) {
                return Center(
                    child: Text(context.loc.emptyTeamsTournament,
                        style: context.textTheme.bodyText1));
              } else if (state is TournamentDetailsLoaded) {
                ///Mostramos el widget
                return TournamentDetailsWidget(
                    listTeamTournaments: state.apiResult.responseObject,
                    tournament: widget.tournamentBaseModel,
                    category: categorySelected);
              } else {
                return Center(
                    child: Text(context.loc.unexpectedError,
                        style: context.textTheme.bodyText1));
              }
            },
          ),
        ],
      ),
    );
  }
}
