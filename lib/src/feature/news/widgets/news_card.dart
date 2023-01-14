import 'package:esports_cuba/constants.dart';
import 'package:esports_cuba/src/feature/favorites/bloc/favorites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:esports_cuba/src/shared/utils.dart';
import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:esports_cuba/src/route/app_router.gr.dart';
import 'package:esports_cuba/resources/general_styles.dart';
import 'package:esports_cuba/src/models/news_base_model.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key? key,
    required this.newsBaseModel,
  }) : super(key: key);

  final NewsBaseModel newsBaseModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: GStyles.containerDarkColor,
      onTap: () {
        context.router.push(NewsDetails(newsBaseModel: newsBaseModel));
      },
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: Constants.MARGIN, vertical: 1.h),
        decoration: BoxDecoration(
            color: GStyles.containerDarkColor,
            borderRadius: BorderRadius.circular(5.0)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 3.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Text(newsBaseModel.title,
                    style: context.textTheme.bodyText1?.copyWith(
                        fontSize: 17.sp, fontFamily: GStyles.fontSanFrancisco)),
              ),
              SizedBox(height: 7.sp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.sp),
                child: Text(Utils.getDate(newsBaseModel.createdAt),
                    style: context.textTheme.bodyText1
                        ?.copyWith(fontSize: 14.sp, color: Colors.white38)),
              ),
              imageNews(),
              SizedBox(height: 1.h),
              shareAndSave(context)
            ],
          ),
        ),
      ),
    );
  }

  ///Verificamos que en caso de solo haber una imagen no hacer el efecto slider
  Container imageNews() {
    return Container(
      height: 30.h,
      width: 100.w,
      margin: EdgeInsets.symmetric(vertical: .6.h),
      child: newsBaseModel.attachments.length != 1
          ? CarouselSlider(
              items: newsBaseModel.attachments.map((image) {
                return Image.network(
                  image,
                  fit: BoxFit.cover,
                  height: 30.h,
                  width: 100.w,
                );
              }).toList(),
              options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: false,
                viewportFraction: 1,
                initialPage: 0,
              ),
            )
          : Image.network(
              newsBaseModel.attachments[0],
              fit: BoxFit.cover,
              height: 30.h,
              width: 100.w,
            ),
    );
  }

  Padding shareAndSave(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.sp, vertical: 12.sp),
            child: Row(
              children: [
                FaIcon(FontAwesomeIcons.solidPaperPlane, size: 17.sp),
                SizedBox(width: 2.w),
                Text(context.loc.share.toUpperCase(),
                    style:
                        context.textTheme.bodyText1?.copyWith(fontSize: 14.sp))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.sp, vertical: 12.sp),
            child: InkWell(
              onTap: () {
                context
                    .read<FavoritesCubit>()
                    .addNewsToFavoriteOfUser(7, newsBaseModel);
              },
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.bookmark, size: 17.sp),
                  SizedBox(width: 2.w),
                  Text(context.loc.save.toUpperCase(),
                      style: context.textTheme.bodyText1
                          ?.copyWith(fontSize: 14.sp))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}