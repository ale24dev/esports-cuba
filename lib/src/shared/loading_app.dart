import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoadingApp extends StatelessWidget {
  const LoadingApp({
    Key? key,
    this.loadingWidget,
  }) : super(key: key);

  final Widget? loadingWidget;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: loadingWidget ??
            SpinKitFadingCube(
              color: Colors.white,
              size: 20.sp,
            ));
  }
}
