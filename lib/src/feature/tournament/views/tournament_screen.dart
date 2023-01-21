import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:esports_cuba/src/feature/tournament/widgets/category_games.dart';
import 'package:esports_cuba/src/feature/tournament/widgets/tournament_list.dart';

class TournamentScreen extends StatelessWidget {
  const TournamentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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


