import 'package:esports_cuba/src/feature/tournament/bloc/tournament_details/tournament_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:esports_cuba/src/shared/extensions.dart';

import '../../../../resources/general_styles.dart';
import '../../../shared/utils.dart';

class CategoryStage extends StatefulWidget {
  CategoryStage({
    super.key,
  });

  @override
  State<CategoryStage> createState() => _CategoryStageState();
}

class _CategoryStageState extends State<CategoryStage> {
  late List<String> listStages;

  int indexSelected = 0;
  @override
  void initState() {
    listStages = Utils.getStageTournament(
        context.read<TournamentDetailsCubit>().listTeamTournament.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: listStages.asMap().entries.map((entry) {
            int index = entry.key;
            String stage = entry.value;
            return GestureDetector(
              onTap: () {
                setState(() {
                  indexSelected = index;
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
                decoration: BoxDecoration(
                    color: indexSelected == index
                        ? GStyles.colorPrimary
                        : GStyles.containerDarkColor,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12, blurRadius: 2, spreadRadius: 2)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    stage,
                    style: context.textTheme.bodyText1?.copyWith(
                        color:
                            indexSelected == index ? Colors.white : Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.sp),
                  ),
                ),
              ),
            );
          }).toList()),
    );
  }
}
