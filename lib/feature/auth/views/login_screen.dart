import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:esports_cuba/resources/images.dart';
import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:esports_cuba/src/shared/constants/auth_type.dart';
import 'package:esports_cuba/src/shared/widgets/generic_text_field.dart';

import 'package:esports_cuba/feature/auth/widgets/social_media_button.dart';

import '../widgets/helper_auth.dart';
import '../../../route/app_router.gr.dart';
import '../../../resources/general_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(Images.wallpaper, fit: BoxFit.fitWidth, width: 100.w),
        Opacity(
            opacity: .4,
            child: Container(height: 100.h, width: 100.w, color: Colors.black)),
        SizedBox(
            height: 100.h,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 5.h),
                  Image.asset(Images.fscLogo),
                  SizedBox(height: 5.h),
                  SizedBox(
                    width: 100.w,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GenericTextField(
                              hintText: context.loc.user,
                              icon: const Icon(Icons.person,
                                  size: 20, color: Colors.black),
                              textEditingController: name,
                              authType: AuthType.name,
                              callBackSetState: () {}),
                          GenericTextField(
                              hintText: context.loc.password,
                              icon: const Icon(Icons.password,
                                  size: 20, color: Colors.black),
                              textEditingController: password,
                              authType: AuthType.password,
                              callBackSetState: () {}),
                          GestureDetector(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                              child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: GStyles.colorPrimary,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [GStyles.boxShadowButton]),
                                  child: Padding(
                                    padding: EdgeInsets.all(16.sp),
                                    child: Text(context.loc.signin,
                                        style: context.textTheme.bodyText2!
                                            .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  )),
                            ),
                            onTap: () async {},
                          )
                        ]),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 2.h),
                      child: Text(context.loc.forgotPassword)),
                  HelperAuth(
                      text: context.loc.dontHaveAccount,
                      textButton: context.loc.register,
                      color: Colors.white,
                      functionCallback: () {
                        context.router.replace(const RegisterScreen());
                      })
                ],
              ),
            )),
      ],
    ));
  }
}
