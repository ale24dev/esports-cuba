import 'package:esports_cuba/constants.dart';
import 'package:esports_cuba/resources/general_styles.dart';
import 'package:esports_cuba/src/models/news_base_model.dart';
import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:esports_cuba/src/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NewsDetails extends StatelessWidget {
  ///Tamaño de la imagen de cabecera
  static late double HEIGHT_IMAGE_HEADER;

  ///Tamaño de la imagen de cabecera
  static late double HEIGHT_STACK_HEADER;

  ///Tamaño de la sección de detalles de usuario
  static late double HEIGHT_USER_INFO;

  NewsDetails({super.key, required this.newsBaseModel}) {
    HEIGHT_IMAGE_HEADER = 30.h;
    HEIGHT_STACK_HEADER = 45.h;
    HEIGHT_USER_INFO = 10.h;
  }

  final NewsBaseModel newsBaseModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 92.h,
            child: ListView(
              children: [
                SizedBox(
                  height: HEIGHT_IMAGE_HEADER,
                  width: 100.w,
                  child: Stack(
                    children: [
                      Container(
                        height: HEIGHT_IMAGE_HEADER,
                        child: Image.network(
                          newsBaseModel.attachments[0],
                          fit: BoxFit.fitWidth,
                          width: 100.w,
                        ),
                      ),
                      Container(
                        height: HEIGHT_IMAGE_HEADER,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.center,
                                end: Alignment.bottomCenter,
                                colors: [
                              GStyles.backGroundDarkColor.withOpacity(.3),
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
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Constants.MARGIN),
                  child: Text(
                    newsBaseModel.title,
                    softWrap: true,
                    style: context.textTheme.headline1?.copyWith(
                        fontFamily: GStyles.fontSanFrancisco, fontSize: 20.sp),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Constants.MARGIN),
                  child: Container(
                    height: HEIGHT_USER_INFO,
                    child: Row(
                      children: [
                        Container(
                          height: 30.sp,
                          width: 30.sp,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(newsBaseModel.user.image)),
                        ),
                        SizedBox(width: 10.sp),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(newsBaseModel.user.nickname,
                                style: context.textTheme.bodyText1
                                    ?.copyWith(fontSize: 16.sp)),
                            SizedBox(height: 5.sp),
                            Text(Utils.getDate(newsBaseModel.createdAt),
                                style: context.textTheme.bodyText1?.copyWith(
                                    fontSize: 14.sp, color: Colors.white38)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(color: Colors.white12),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Constants.MARGIN),
                  child: Text(newsBaseModel.text,
                      softWrap: true,
                      style: TextStyle(color: Colors.white60, fontSize: 16.sp)),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Constants.MARGIN),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FaIcon(FontAwesomeIcons.solidPaperPlane, size: 17.sp),
                  FaIcon(FontAwesomeIcons.bookmark, size: 17.sp),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
