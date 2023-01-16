// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:esports_cuba/src/shared/utils.dart';
import 'package:esports_cuba/resources/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:esports_cuba/resources/general_styles.dart';
import 'package:esports_cuba/src/shared/constants/auth_type.dart';
import 'package:esports_cuba/src/shared/widgets/generic_text_field.dart';

class RegisterUserScreen extends StatefulWidget {
  const RegisterUserScreen({super.key});

  @override
  State<RegisterUserScreen> createState() => _RegisterUserScreenState();
}

class _RegisterUserScreenState extends State<RegisterUserScreen> {
  TextEditingController username = TextEditingController();

  String? birthday;

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
                  SizedBox(height: 2.h),
                  SizedBox(
                    width: 100.w,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                    child: child!,
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
                                  );
                                },
                              );
                              if (selectedBirthday != null) {
                                setState(() {
                                  birthday = Utils.getDate(selectedBirthday);
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
                                    Text(birthday ?? context.loc.birthday,
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
                          /*Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 2.h),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: CSCPicker(
                                countryDropdownLabel: context.loc.country,
                                selectedItemStyle:
                                    const TextStyle(color: Colors.black),
                                dropdownItemStyle:
                                    const TextStyle(color: Colors.white),
                                dropdownDecoration:
                                    const BoxDecoration(color: Colors.red),
                                currentState: "Cuba",
                                showCities: false,
                                showStates: false,
                                onCountryChanged: (value) {
                                  setState(() {
                                    country = value;
                                  });
                                },
                              ),
                            ),
                          ),*/
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
                              /*apiResult = await serviceLocator<AuthRepository>()
                                  .signUp(
                                      email: email.text,
                                      password: password.text,
                                      apiResult: ApiResult());
                              SharedPreferences sharedPreferences =
                                  await Utils.sharedPreferencesInstance();
                              print(sharedPreferences.getString("token"));
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
                              setState(() {});*/
                            },
                          )
                        ]),
                  ),
                ],
              ),
            )),
      ],
    ));
  }
}
