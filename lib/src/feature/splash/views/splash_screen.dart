import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:esports_cuba/src/shared/loading_app.dart';
import 'package:esports_cuba/src/feature/splash/splash_controller.dart';

import '../../../../resources/images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController.checkLogin(context);
    return Scaffold(
        // body: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Image.asset(
        //       Images.fscLogo,
        //       height: 30.h,
        //     ),
        //     const LoadingApp()
        //   ],
        // ),
        body: Stack(
      children: [
        Image.asset(Images.wallpaper, fit: BoxFit.fitWidth, width: 100.w),
        Opacity(
            opacity: .4,
            child: Container(height: 100.h, width: 100.w, color: Colors.black)),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset(Images.fscLogo),const  LoadingApp()],
        ),
      ],
    ));
  }
}
