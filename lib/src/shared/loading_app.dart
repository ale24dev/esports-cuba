import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoadingApp extends StatelessWidget {
  const LoadingApp({
    Key? key,
    this.loadingWidget, this.size,
  }) : super(key: key);

  final Widget? loadingWidget;

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: loadingWidget ??
            SpinKitFadingCube(
              color: Colors.white,
              size: size ?? 20.sp,
            ));
  }
}
