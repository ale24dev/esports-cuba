import 'package:esports_cuba/locator.dart';
import 'package:esports_cuba/src/repositories/auth_repository.dart';
import 'package:esports_cuba/src/shared/loading_app.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';
import 'package:esports_cuba/src/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:esports_cuba/src/shared/constants/auth_type.dart';
import 'package:esports_cuba/src/feature/auth/bloc/auth_cubit.dart';
import 'package:esports_cuba/src/feature/auth/const/user_state.dart';
import 'package:esports_cuba/src/shared/widgets/generic_text_field.dart';

import '../widgets/helper_auth.dart';
import '../../../../resources/images.dart';
import '../../../route/app_router.gr.dart';
import '../../../../resources/general_styles.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    late ApiResult apiResult;
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
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
                              textEditingController: email,
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
                                    child: Text(context.loc.registerButton,
                                        style: context.textTheme.bodyText2!
                                            .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  )),
                            ),
                            onTap: () async {
                              print("email: " + email.text);
                              print("password: " + password.text);
                              apiResult = await serviceLocator<AuthRepository>()
                                  .signUp(
                                      email: email.text,
                                      password: password.text,
                                      apiResult: ApiResult());

                              apiResult.error != null
                                  ? showDialog(
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
                                    )
                                  : context.router
                                      .replace(const LayoutScreen());

                              //TODO: MOSTRAR EL SNACKBAR DE USUARIO REGISTRADO EXITOSAMENTE
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content:
                                    Text("Has sido registrado exitosamente"),
                                backgroundColor: GStyles.colorPrimary,
                                duration: Duration(seconds: 5),
                              ));
                              setState(() {});
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
