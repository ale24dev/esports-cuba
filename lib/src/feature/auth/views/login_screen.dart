// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:esports_cuba/locator.dart';
import 'package:esports_cuba/src/shared/utils.dart';
import 'package:esports_cuba/resources/images.dart';
import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:esports_cuba/src/shared/loading_app.dart';
import 'package:esports_cuba/src/shared/repository/ApiResult.dart';
import 'package:esports_cuba/src/repositories/auth_repository.dart';
import 'package:esports_cuba/src/feature/auth/bloc/auth_cubit.dart';
import 'package:esports_cuba/src/feature/drawer/cubit/drawer_cubit.dart';

import '../widgets/helper_auth.dart';
import '../../../route/app_router.gr.dart';
import '../../../../resources/general_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
          key: _scaffoldKey,
          body: Stack(
            children: [
              Image.asset(Images.wallpaper, fit: BoxFit.fitWidth, width: 100.w),
              Opacity(
                  opacity: .4,
                  child: Container(
                      height: 100.h, width: 100.w, color: Colors.black)),
              SizedBox(
                  height: 100.h,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 5.h),
                        Image.asset(Images.fscLogo),
                        SizedBox(height: 5.h),
                        BlocBuilder<AuthCubit, AuthhState>(
                          builder: (context, state) {
                            final bloc = context.read<AuthCubit>();

                            return state is AuthLoading
                                ? const LoadingApp()
                                : SizedBox(
                                    width: 100.w,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          emailField(bloc),
                                          passwordField(bloc),
                                          SizedBox(
                                            width: double.infinity,
                                            child: StreamBuilder(
                                                stream:
                                                    bloc.formSignInValidStream,
                                                builder: (context,
                                                    AsyncSnapshot snapshot) {
                                                  return Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10.0.w,
                                                            vertical: 1.h),
                                                    child: GestureDetector(
                                                      onTap: !snapshot.hasData
                                                          ? null
                                                          : () async {
                                                              bloc.changeStateLoad(
                                                                  true);
                                                              /*bloc.emit(
                                                              AuthLoading());*/
                                                              print("Llegue");
                                                              ApiResult apiResult = await serviceLocator<
                                                                      AuthRepository>()
                                                                  .logIn(
                                                                      context:
                                                                          context,
                                                                      email: bloc
                                                                          .email,
                                                                      password: bloc
                                                                          .password,
                                                                      apiResult:
                                                                          ApiResult());

                                                              if (apiResult
                                                                      .error ==
                                                                  null) {
                                                                _scaffoldKey
                                                                    .currentContext
                                                                    ?.read<
                                                                        DrawerCubit>()
                                                                    .getUser(
                                                                        context);
                                                                _scaffoldKey
                                                                    .currentContext
                                                                    ?.router
                                                                    .replace(
                                                                        const LayoutScreen());
                                                              } else {
                                                                showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return FutureBuilder(
                                                                        future: Utils.apiResultShow(
                                                                            apiResult:
                                                                                apiResult,
                                                                            context:
                                                                                context),
                                                                        builder:
                                                                            ((context,
                                                                                AsyncSnapshot snapshot) {
                                                                          if (!snapshot
                                                                              .hasData) {
                                                                            return const LoadingApp();
                                                                          } else {
                                                                            return snapshot.data;
                                                                          }
                                                                        }));
                                                                  },
                                                                );
                                                              }
                                                            },
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                            color: !snapshot
                                                                    .hasData
                                                                ? Colors.grey
                                                                : GStyles
                                                                    .colorPrimary,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  16.sp),
                                                          child: Text(
                                                              context
                                                                  .loc.signin,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: context
                                                                  .textTheme
                                                                  .bodyText2!
                                                                  .copyWith(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              )),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                          ),
                                          Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.only(top: 2.h),
                                              child: Text(
                                                  context.loc.forgotPassword,
                                                  style: context
                                                      .textTheme.bodyText2
                                                      ?.copyWith(
                                                          color:
                                                              Colors.white))),
                                          HelperAuth(
                                              text: context.loc.dontHaveAccount,
                                              textButton: context.loc.register,
                                              color: Colors.white,
                                              functionCallback: () {
                                                context.router.replace(
                                                    const SignupScreen());
                                              })
                                        ]),
                                  );
                          },
                        ),
                      ],
                    ),
                  )),
            ],
          )),
    );
  }

  Widget emailField(AuthCubit bloc) {
    return StreamBuilder<String>(
        stream: bloc.emailStream,
        builder: (context, AsyncSnapshot snapshot) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                snapshot.hasError
                    ? Text(
                        context.loc.emailInvalid,
                        style: TextStyle(color: GStyles.colorFail),
                      )
                    : const SizedBox.shrink(),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 1,
                            color: Colors.black12,
                            spreadRadius: 1)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: TextFormField(
                      onChanged: bloc.changeEmail,
                      style: context.textTheme.bodyText1?.copyWith(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontFamily: GStyles.fontTeko),
                      decoration: InputDecoration(
                          //counterText: snapshot.data.toString(),
                          labelText: context.loc.email,
                          labelStyle: const TextStyle(color: Colors.black),
                          prefixIcon:
                              const Icon(Icons.email, color: Colors.black),
                          //errorText: snapshot.error,
                          hintStyle: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 30),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 1.0)),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 1.0))),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  StreamBuilder<String> passwordField(AuthCubit bloc) {
    return StreamBuilder<String>(
        stream: bloc.passwordStream,
        builder: (context, AsyncSnapshot snapshot) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                snapshot.hasError
                    ? Text(
                        context.loc.passwordInvalid,
                        style: TextStyle(color: GStyles.colorFail),
                      )
                    : const SizedBox.shrink(),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 1,
                            color: Colors.black12,
                            spreadRadius: 1)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: TextFormField(
                      onChanged: bloc.changePassword,
                      style: context.textTheme.bodyText1?.copyWith(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontFamily: GStyles.fontTeko),
                      decoration: InputDecoration(
                          //counterText: snapshot.data.toString(),
                          labelText: context.loc.password,
                          labelStyle: const TextStyle(color: Colors.black),
                          prefixIcon:
                              const Icon(Icons.password, color: Colors.black),
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.remove_red_eye,
                                color: Colors.black,
                              )),
                          hintStyle: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 30),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 1.0)),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 1.0))),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
