import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/category_games.dart';
import '../widgets/tournament_list.dart';
import '../constants/tournament_state_type.dart';
import '../../../../resources/general_styles.dart';
import 'package:esports_cuba/src/shared/extensions.dart';

class TournamentScreen extends StatefulWidget {
  const TournamentScreen({super.key});

  @override
  State<TournamentScreen> createState() => _TournamentScreenState();
}

class _TournamentScreenState extends State<TournamentScreen> {
  ///Estado actual de la categoria de torneo
  late TournamentStateType tournamentStateType;

  @override
  void initState() {
    tournamentStateType = TournamentStateType.open;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Column(
        children: [
          CategoryGames(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      tournamentStateType = TournamentStateType.open;
                    });
                  },
                  child: tournamentStateCategory(context, context.loc.open,
                      tournamentStateType == TournamentStateType.open),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      tournamentStateType = TournamentStateType.closed;
                    });
                  },
                  child: tournamentStateCategory(context, context.loc.closed,
                      tournamentStateType == TournamentStateType.closed),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      tournamentStateType = TournamentStateType.progress;
                    });
                  },
                  child: tournamentStateCategory(context, context.loc.progress,
                      tournamentStateType == TournamentStateType.progress),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      tournamentStateType = TournamentStateType.finished;
                    });
                  },
                  child: tournamentStateCategory(context, context.loc.finished,
                      tournamentStateType == TournamentStateType.finished),
                ),
              ],
            ),
          ),
          SizedBox(height: 1.h),
          TournamentList(tournamentStateType: tournamentStateType),
        ],
      ),
    );
  }

  Widget tournamentStateCategory(
      BuildContext context, String text, bool isSelected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1.w),
      decoration: BoxDecoration(
          color: isSelected ? GStyles.colorPrimary : GStyles.containerDarkColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 2, spreadRadius: 2)
          ]),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          text,
          style: context.textTheme.bodyText1?.copyWith(
              color: isSelected ? Colors.white : Colors.grey,
              fontWeight: FontWeight.normal, fontSize: 14.sp),
        ),
      ),
    );
  }
}
