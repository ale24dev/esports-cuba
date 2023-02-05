import 'package:esports_cuba/src/shared/widgets/bookmark.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:esports_cuba/constants.dart';
import 'package:esports_cuba/src/shared/utils.dart';
import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:esports_cuba/src/shared/loading_app.dart';
import 'package:esports_cuba/src/route/app_router.gr.dart';
import 'package:esports_cuba/resources/general_styles.dart';
import 'package:esports_cuba/src/models/news_base_model.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';
import 'package:esports_cuba/src/feature/bookmark/bloc/bookmark_cubit.dart';

import '../../../shared/widgets/generic_snack_bar.dart';

class NewsCard extends StatefulWidget {
  const NewsCard({
    Key? key,
    required this.newsBaseModel,
  }) : super(key: key);

  final NewsBaseModel newsBaseModel;

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  late ApiResult apiResult;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: GStyles.containerDarkColor,
      onTap: () {
        context.router.push(NewsDetails(newsBaseModel: widget.newsBaseModel));
      },
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: Constants.MARGIN, vertical: 1.h),
        decoration: BoxDecoration(
            color: GStyles.containerDarkColor,
            borderRadius: BorderRadius.circular(5.0)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Text(widget.newsBaseModel.title,
                    style: context.textTheme.bodyText1?.copyWith(
                        fontSize: 17.sp, fontFamily: GStyles.fontSanFrancisco)),
              ),
              SizedBox(height: 7.sp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.sp),
                child: Row(
                  children: [
                    Text(Utils.getDate(widget.newsBaseModel.createdAt),
                        style: context.textTheme.bodyText1
                            ?.copyWith(fontSize: 14.sp, color: Colors.white38)),
                    SizedBox(
                        child: Text(" - ",
                            style: context.textTheme.bodyText1?.copyWith(
                                fontSize: 14.sp, color: Colors.white38))),
                    Text(
                      widget.newsBaseModel.user.username,
                      style: context.textTheme.bodyText1
                          ?.copyWith(fontSize: 14.sp, color: Colors.white38),
                    ),
                  ],
                ),
              ),
              imageNews(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    shareWidget(context),
                    saveWidget(context),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ///Verificamos que en caso de solo haber una imagen no hacer el efecto slider
  Widget imageNews() {
    return Container(
      height: 25.h,
      width: 100.w,
      margin: EdgeInsets.symmetric(vertical: .6.h),
      child: widget.newsBaseModel.attachments.length != 1
          ? CarouselSlider(
              items: widget.newsBaseModel.attachments.map((image) {
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
              widget.newsBaseModel.attachments[0],
              fit: BoxFit.cover,
              height: 30.h,
              width: 100.w,
            ),
    );
  }

  Widget saveWidget(BuildContext context) {
    return BlocBuilder<BookmarkCubit, BookmarkState>(
      builder: (context, state) {
        if (state is BookmarkLoaded) {
          apiResult = state.apiResult;
        }
        if (state is BookmarkError) {
          ScaffoldMessenger.of(context).showSnackBar(
              GenericSnackBar(text: context.loc.logoutSuccessfully)
                  as SnackBar);
        }
        return state is BookmarkLoaded
            ? Bookmark(
                newsBaseModel: widget.newsBaseModel,
                apiResult: apiResult,
                inDetails: false)
            : state is BookmarkEmpty
                ? Bookmark(
                    newsBaseModel: widget.newsBaseModel, inDetails: false)
                : Padding(
                    padding: EdgeInsets.only(right: 14.w),
                    child: LoadingApp(size: 15.sp));
      },
    );
  }

  Widget shareWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.sp, vertical: 12.sp),
      child: Row(
        children: [
          FaIcon(FontAwesomeIcons.solidPaperPlane, size: 17.sp),
          SizedBox(width: 2.w),
          Text(context.loc.share.toUpperCase(),
              style: context.textTheme.bodyText1?.copyWith(fontSize: 14.sp))
        ],
      ),
    );
  }
}
