import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../resources/general_styles.dart';
import '../../../models/tournament_base_model.dart';

class ImageHeaderSection extends StatelessWidget {
  const ImageHeaderSection({
    Key? key,
    required this.HEADER_TOURNAMENT_IMAGE,
    required this.tournament,
  }) : super(key: key);

  final double HEADER_TOURNAMENT_IMAGE;
  final TournamentBaseModel tournament;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: HEADER_TOURNAMENT_IMAGE,
          width: double.infinity,
          child: Image.network(
            tournament.imageHeader,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: HEADER_TOURNAMENT_IMAGE,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                GStyles.backGroundDarkColor.withOpacity(.5),
                GStyles.backGroundDarkColor
              ])),
        ),
        Positioned(
            top: 4.h,
            left: 4.w,
            child: IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.x,
                  size: 20.sp,
                ),
                onPressed: () {
                  context.router.pop();
                }))
      ],
    );
  }
}
