import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:esports_cuba/resources/general_styles.dart';
import 'package:esports_cuba/src/feature/splash/splash_controller.dart';

import '../../../../resources/images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController.checkLogin(context);
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(Images.wallpaper, fit: BoxFit.fitWidth, width: 100.w),
        Opacity(
            opacity: .4,
            child: Container(height: 100.h, width: 100.w, color: Colors.black)),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Images.fscLogo),
            Center(
                child: SpinKitFadingCube(
              color: Colors.white,
              size: 20.sp,
            ))
          ],
        ),
      ],
    ));
  }
}
