import 'package:esports_cuba/src/models/news_base_model.dart';
import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../resources/general_styles.dart';
import '../../feature/bookmark/bloc/bookmark_cubit.dart';
import '../utils.dart';

class Bookmark extends StatelessWidget {
  const Bookmark(
      {super.key,
      this.apiResult,
      required this.newsBaseModel,
      required this.inDetails});

  final ApiResult? apiResult;

  final NewsBaseModel newsBaseModel;

  ///Bandera que determina si el bookmark esta en la vista de detalles de anuncio
  final bool inDetails;

  @override
  Widget build(BuildContext context) {
    bool equalElement = Utils.checkBookmarkInListNews(
        listNewsBaseModel: apiResult != null ? apiResult!.responseObject : [],
        newBaseModel: newsBaseModel);
    return GestureDetector(
      onTap: () {
        if (equalElement) {
          context
              .read<BookmarkCubit>()
              .removeLocalBookmarkOfUser(newsBaseModel, context);
        } else {
          context
              .read<BookmarkCubit>()
              .addBookmarkLocalToUser(newsBaseModel, context);
          Utils.genericSnackBar(
              context: context,
              text: context.loc.newsAdd,
              color: GStyles.colorPrimary);
        }
      },
      child: Container(
        color: Colors.transparent,
        child: GestureDetector(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.sp, vertical: 19.sp),
            child: Row(
              children: [
                equalElement
                    ? FaIcon(FontAwesomeIcons.solidBookmark, size: 17.sp)
                    : FaIcon(FontAwesomeIcons.bookmark, size: 17.sp),
                SizedBox(width: 2.w),
                !inDetails
                    ? Text(context.loc.save.toUpperCase(),
                        style: context.textTheme.bodyText1
                            ?.copyWith(fontSize: 14.sp))
                    : const SizedBox.shrink()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
