import 'package:esports_cuba/resources/general_styles.dart';
import 'package:esports_cuba/src/feature/tournament/widgets/category_games.dart';
import 'package:esports_cuba/src/feature/tournament/widgets/tournament_list.dart';
import 'package:esports_cuba/src/models/game_base_model.dart';
import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:esports_cuba/src/shared/repository/ApiResult.dart';
import 'package:esports_cuba/src/feature/tournament/bloc/game_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TournamentScreen extends StatelessWidget {
  const TournamentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      child: Column(
        children: [
          CategoryGames(),
          TournamentList(),
        ],
      ),
    );
  }
}


