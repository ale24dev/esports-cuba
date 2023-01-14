import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
      onTap: () {
        context.router.push(NewsDetails(newsBaseModel: newsBaseModel));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
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
                        fontSize: 18, fontFamily: GStyles.fontSanFrancisco)),
              ),
              SizedBox(height: 7.sp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.sp),
                child: Text(Utils.getDate(newsBaseModel.createdAt),
                    style: context.textTheme.bodyText1
                        ?.copyWith(fontSize: 14.sp, color: Colors.white38)),
              ),
              Container(
                height: 30.h,
                width: 100.w,
                margin: EdgeInsets.symmetric(vertical: .6.h),
                child: imageNews(),
              ),
              SizedBox(height: 2.h),
              shareAndSave(context)
            ],
          ),
        ),
      ),
    );
  }

  Padding shareAndSave(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              FaIcon(FontAwesomeIcons.solidPaperPlane, size: 17.sp),
              SizedBox(width: 2.w),
              Text(context.loc.share.toUpperCase(),
                  style: context.textTheme.bodyText1?.copyWith(fontSize: 14.sp))
            ],
          ),
          Row(
            children: [
              FaIcon(FontAwesomeIcons.bookmark, size: 17.sp),
              SizedBox(width: 2.w),
              Text(context.loc.save.toUpperCase(),
                  style: context.textTheme.bodyText1?.copyWith(fontSize: 14.sp))
            ],
          ),
        ],
      ),
    );
  }

  CarouselSlider imageNews() {
    return CarouselSlider(
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
    );
  }
}
