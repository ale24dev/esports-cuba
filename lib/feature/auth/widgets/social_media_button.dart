import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../resources/general_styles.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.sp),
          boxShadow: [GStyles.socialMediaShadowButton]),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 20.sp),
        child: Image.asset(image, width: 5.w),
      ),
    );
  }
}
