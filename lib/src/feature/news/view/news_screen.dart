import 'package:esports_cuba/resources/general_styles.dart';
import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:esports_cuba/src/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:esports_cuba/src/models/news_base_model.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';
import 'package:esports_cuba/src/feature/news/bloc/news_cubit.dart';

class NewsScreen extends StatelessWidget {
  late ApiResult apiResult;
  NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsLoaded) {
          apiResult = state.apiResult;
        }
        return state is NewsLoading
            ? Center(
                child: SpinKitFadingCube(
                color: Colors.white,
                size: 20.sp,
              ))
            : SizedBox(
                height: 100.h,
                width: 100.w,
                child: ListView.builder(
                    itemCount: apiResult.responseObject.length,
                    itemBuilder: ((context, index) {
                      NewsBaseModel newsBaseModel =
                          apiResult.responseObject[index];

                      return Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 1.h),
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
                                child: Text(newsBaseModel.text,
                                    style: context.textTheme.bodyText1
                                        ?.copyWith(fontSize: 20)),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Text(
                                    Utils.getDate(newsBaseModel.createdAt),
                                    style: context.textTheme.bodyText1),
                              ),
                              Container(
                                height: 30.h,
                                width: 100.w,
                                margin: EdgeInsets.symmetric(vertical: .6.h),
                                child: CarouselSlider(
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
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const FaIcon(FontAwesomeIcons.share),
                                        SizedBox(width: 1.w),
                                        Text("Compartir",
                                            style: context.textTheme.bodyText1)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const FaIcon(FontAwesomeIcons.bookmark),
                                        SizedBox(width: 1.w),
                                        Text("Guardar",
                                            style: context.textTheme.bodyText1)
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    })),
              );
      },
    );
  }
}
