import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../constants.dart';
import '../../../models/player_base_model.dart';
import '../../../../resources/general_styles.dart';
import 'package:esports_cuba/src/shared/extensions.dart';

class FavoritesCard extends StatelessWidget {
  const FavoritesCard({
    super.key,
    required this.favorite,
    required this.index,
  });

  final dynamic favorite;

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: index % 2 == 0
          ? GStyles.containerDarkColor
          : GStyles.backGroundDarkColor,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: Constants.MARGIN, vertical: 1.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 28.sp,
              width: 28.sp,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(favorite.image),
              ),
            ),
            SizedBox(width: 4.w),
            Expanded(
              child: Text(favorite.name,
                  textAlign: TextAlign.start,
                  style: context.textTheme.bodyText1),
            ),
            Center(
              child: FaIcon(FontAwesomeIcons.solidHeart,
                  color: GStyles.colorFail, size: 19.sp),
            )
          ],
        ),
      ),
    );
  }
}
