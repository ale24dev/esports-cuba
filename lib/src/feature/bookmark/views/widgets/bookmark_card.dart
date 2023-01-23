import 'package:esports_cuba/constants.dart';
import 'package:esports_cuba/resources/general_styles.dart';
import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:esports_cuba/src/shared/utils.dart';
import 'package:flutter/material.dart';

import 'package:esports_cuba/src/models/bookmark_base_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../bloc/bookmark_cubit.dart';

class BookmarkCard extends StatelessWidget {
  const BookmarkCard({
    Key? key,
    required this.bookmarkBaseModel,
  }) : super(key: key);

  final BookmarkBaseModel bookmarkBaseModel;

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
                      bookmarkBaseModel.newsBaseModel.title,
                      softWrap: true,
                      style: context.textTheme.bodyText1?.copyWith(
                          fontSize: 17.sp,
                          fontFamily: GStyles.fontSanFrancisco),
                    ),
                  ),
                  SizedBox(width: 8.sp),
                  Expanded(
                    child: Image.network(
                      bookmarkBaseModel.newsBaseModel.attachments[0],
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.sp),
                child: Text(
                    "${Utils.getDate(bookmarkBaseModel.newsBaseModel.createdAt)} - ${bookmarkBaseModel.userBaseModel.username}",
                    style: context.textTheme.bodyText1
                        ?.copyWith(fontSize: 14.sp, color: Colors.white38)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox.shrink(),
                  InkWell(
                    onTap: () {
                      context.read<BookmarkCubit>().removeBookmarkOfUser(
                          bookmarkBaseModel.newsBaseModel, context);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox.shrink(),
                          FaIcon(FontAwesomeIcons.solidBookmark, size: 18.sp)
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
