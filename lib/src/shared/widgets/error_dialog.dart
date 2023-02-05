import 'package:esports_cuba/resources/general_styles.dart';
import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../resources/images.dart';
import '../utils.dart';

class ErrorDialog extends StatelessWidget {
  String errorText;
  String? buttonText;
  String? headerText;
  void Function()? onTap;
  bool noHeader;

  ErrorDialog(
      {Key? key,
      required this.errorText,
      this.buttonText,
      this.onTap,
      this.headerText,
      this.noHeader = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: GStyles.backGroundDarkColor,
      child: Container(
        padding: EdgeInsets.fromLTRB(4.w, 2.h, 4.w, 2.h),
        height: 65.w,
        width: 80.w,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (noHeader == false)
                Text(
                  headerText ?? context.loc.error,
                  style: context.textTheme.headline3!
                      .copyWith(color: context.theme.primaryColor),
                  textAlign: TextAlign.center,
                ),
              Expanded(
                  child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 10.sp, 0, 10.sp),
                    child: Text(
                      errorText,
                      style: context.textTheme.headline4!
                          .copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )),
              ElevatedButton(
                child: Text(buttonText ?? context.loc.exit),
                onPressed: onTap ?? Utils.exitApp(),
              ),
            ],
          ),
        ),
      ),
    );
  }
// @override
// Widget build(BuildContext context) {
//   return Dialog(
//     child: Container(
//       padding: EdgeInsets.fromLTRB(5.w, 8.w, 5.w, 8.w),
//       height: 80.w,
//       width: 80.w,
//       child: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             if (noHeader == false)
//               Text(
//                 headerText ?? context.loc.error,
//                 style: context.textTheme.headline3!
//                     .copyWith(color: context.theme.primaryColor),
//                 textAlign: TextAlign.center,
//               ),
//             Expanded(
//                 child: Center(
//                   child: Padding(
//                     padding: EdgeInsets.fromLTRB(0, 10.sp, 0, 10.sp),
//                     child: Text(
//                       errorText,
//                       style: context.textTheme.headline4!
//                           .copyWith(color: Colors.black),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 )),
//             Row(
//               children: [
//                 Flexible(child: Image.asset(Images.fancyQatarToRight)),
//                 SizedBox(width: 3.w),
//                 OrangeButton(
//                   text: buttonText ?? context.loc.exit,
//
//                   onTap: onTap ?? SplashController.exitApp(),
//                 ),
//                 SizedBox(
//                   width: 3.w,
//                 ),
//                 Flexible(child: Image.asset(Images.fancyQatarToLeft)),
//               ],
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
//
}
