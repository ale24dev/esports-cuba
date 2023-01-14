import 'package:esports_cuba/constants.dart';
import 'package:esports_cuba/resources/general_styles.dart';
import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:esports_cuba/src/shared/utils.dart';
import 'package:flutter/material.dart';

import 'package:esports_cuba/src/models/favorites_base_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FavoritesCard extends StatelessWidget {
  const FavoritesCard({
    Key? key,
    required this.favoritesBaseModel,
  }) : super(key: key);

  final FavoritesBaseModel favoritesBaseModel;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:
            EdgeInsets.symmetric(horizontal: Constants.MARGIN, vertical: 1.h),
        decoration: BoxDecoration(
            color: GStyles.containerDarkColor,
            borderRadius: BorderRadius.circular(5.0)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 60.w,
                    child: Text(
                      favoritesBaseModel.newsBaseModel.title,
                      softWrap: true,
                      style: context.textTheme.bodyText1?.copyWith(
                          fontSize: 17.sp,
                          fontFamily: GStyles.fontSanFrancisco),
                    ),
                  ),
                  SizedBox(width: 8.sp),
                  Expanded(
                    child: Image.network(
                      favoritesBaseModel.newsBaseModel.attachments[0],
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.sp),
                child: Text(
                    "${Utils.getDate(favoritesBaseModel.newsBaseModel.createdAt)} - ${favoritesBaseModel.userBaseModel.nickname}",
                    style: context.textTheme.bodyText1
                        ?.copyWith(fontSize: 14.sp, color: Colors.white38)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox.shrink(),
                    FaIcon(FontAwesomeIcons.solidBookmark, size: 18.sp)
                  ],
                ),
              )
            ],
          ),
        ));
  }
}