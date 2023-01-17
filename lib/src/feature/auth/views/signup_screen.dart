import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:esports_cuba/src/shared/utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:esports_cuba/locator.dart';
import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:esports_cuba/src/shared/loading_app.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:esports_cuba/src/shared/constants/auth_type.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';
import 'package:esports_cuba/src/repositories/auth_repository.dart';
import 'package:esports_cuba/src/shared/widgets/dialog_message.dart';
import 'package:esports_cuba/src/shared/widgets/generic_text_field.dart';

import '../widgets/helper_auth.dart';
import '../../../../resources/images.dart';
import '../../../route/app_router.gr.dart';
import '../../../../resources/general_styles.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  DateTime? birthday;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;

  @override
  void initState() {
    // TODO: implement initState
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email.clear();
    password.clear();
    username.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late ApiResult apiResult;
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
                  SizedBox(height: 1.h),
                  Image.asset(Images.fscLogo),
                  SizedBox(
                    width: 100.w,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GenericTextField(
                            hintText: context.loc.email,
                            icon: const Icon(FontAwesomeIcons.at,
                                size: 20, color: Colors.black),
                            textEditingController: email,
                            authType: AuthType.name,
                          ),
                          GenericTextField(
                            hintText: context.loc.password,
                            icon: const Icon(Icons.password,
                                size: 20, color: Colors.black),
                            textEditingController: password,
                            authType: AuthType.password,
                          ),
                          GenericTextField(
                            hintText: context.loc.username,
                            icon: const Icon(Icons.person,
                                size: 20, color: Colors.black),
                            textEditingController: username,
                            authType: AuthType.name,
                          ),
                          GestureDetector(
                            onTap: () async {
                              DateTime? selectedBirthday = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1920),
                                lastDate: DateTime.now(),
                                locale: Locale(context.currentLanguage),
                                builder: (context, child) {
                                  return Theme(
                                    data: ThemeData().copyWith(
                                        textTheme: context.textTheme,
                                        colorScheme: ColorScheme.dark(
                                          primary: GStyles.colorPrimary,
                                          surface: GStyles.colorPrimary,
                                          onSurfaceVariant: Colors.yellow,
                                          onTertiary: Colors.pink,
                                        ),
                                        dialogBackgroundColor:
                                            GStyles.backGroundDarkColor),
                                    child: child!,
                                  );
                                },
                              );
                              if (selectedBirthday != null) {
                                setState(() {
                                  birthday = selectedBirthday;
                                });
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 1.h),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 7.w, vertical: 2.h),
                                child: Row(
                                  children: [
                                    FaIcon(FontAwesomeIcons.cakeCandles,
                                        color: Colors.black, size: 16.sp),
                                    SizedBox(width: 4.7.w),
                                    Text(
                                        birthday != null
                                            ? Utils.getDate(birthday!)
                                            : context.loc.birthday,
                                        style: context.textTheme.bodyText1
                                            ?.copyWith(
                                                color: Colors.black,
                                                fontSize: 16.sp,
                                                fontFamily: GStyles.fontTeko)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0.w, vertical: 1.h),
                              child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: GStyles.colorPrimary,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [GStyles.boxShadowButton]),
                                  child: Padding(
                                    padding: EdgeInsets.all(16.sp),
                                    child: Text(context.loc.registerButton,
                                        style: context.textTheme.bodyText2!
                                            .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  )),
                            ),
                            onTap: () async {
                              ///Validamos los campos vacíos
                              if (username.text.isEmpty ||
                                  password.text.isEmpty ||
                                  email.text.isEmpty ||
                                  birthday == null) {
                                showDialog(
                                    context: context,
                                    builder: ((context) {
                                      return DialogMessage(
                                          title: context.loc.authError,
                                          text: context.loc.emptyFields,
                                          withTranslate: false);
                                    }));
                              } else {
                                apiResult =
                                    await serviceLocator<AuthRepository>()
                                        .signUp(
                                            email: email.text,
                                            password: password.text,
                                            apiResult: ApiResult(),
                                            username: username.text,
                                            birthday: birthday!);

                                if (apiResult.error == null) {
                                  context.router.replace(const LayoutScreen());
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return FutureBuilder(
                                          future: Utils.apiResultShow(
                                              apiResult: apiResult,
                                              context: context),
                                          builder: ((context,
                                              AsyncSnapshot snapshot) {
                                            if (!snapshot.hasData) {
                                              return const LoadingApp();
                                            } else {
                                              return snapshot.data;
                                            }
                                          }));
                                    },
                                  );
                                  setState(() {});
                                }
                              }
                            },
                          )
                        ]),
                  ),
                  HelperAuth(
                      text: context.loc.haveAccount,
                      textButton: context.loc.signin,
                      color: Colors.white,
                      functionCallback: () {
                        context.router.replace(const LoginScreen());
                      })
                ],
              ),
            )),
      ],
    ));
  }
}
