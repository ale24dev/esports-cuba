import 'package:esports_cuba/resources/custom_material_color.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:esports_cuba/resources/general_styles.dart';

class Themes {
  static ThemeData get lightTheme => ThemeData(
        iconTheme: const IconThemeData(color: Colors.black),
        drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.only(top: 10, bottom: 5),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          hoverColor: Colors.grey,
          focusColor: Colors.grey,
          labelStyle: GStyles.headline5.copyWith(
              color: Colors.grey,
              fontSize: 18.sp,
              fontFamily: GStyles.fontOkine),
          errorStyle: TextStyle(color: GStyles.colorSecondary, fontSize: 16.sp),
        ),
        checkboxTheme: GStyles.checkBoxTheme,
        primaryColor: GStyles.colorPrimary,
        primaryColorDark: GStyles.colorPrimary,
        primaryColorLight: GStyles.colorPrimary,
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: GStyles.colorPrimary,
            secondary: GStyles.colorSecondary,
            onSecondaryContainer: GStyles.backgroundCircularIndicatorColor),
        textTheme: TextTheme(
          bodyText1: GStyles.bodyText,
          headline1: GStyles.headline1,
          headline2: GStyles.headline2,
          headline3: GStyles.headline3,
          headline4: GStyles.headline4,
          headline5: GStyles.headline5,
          subtitle1: GStyles.textBottomNavigationBarItemSelectedStyle,
          subtitle2: GStyles.textBottomNavigationBarItemStyle,
          button: TextStyle(fontSize: 18.sp, color: GStyles.colorPrimary),
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        scaffoldBackgroundColor: GStyles.backGroundDarkColor,
        primarySwatch: CustomMaterialColor.mdColor(
            r: GStyles.colorPrimary.red,
            g: GStyles.colorPrimary.green,
            b: GStyles.colorPrimary.blue),
        appBarTheme: AppBarTheme(
            backgroundColor: GStyles.backGroundDarkColor, elevation: 0),
        drawerTheme:
            DrawerThemeData(backgroundColor: GStyles.backGroundDarkColor),
        iconTheme: const IconThemeData(color: Colors.white),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.only(top: 10, bottom: 5),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          hoverColor: Colors.grey,
          focusColor: Colors.grey,
          labelStyle: GStyles.headline5.copyWith(
              color: Colors.grey,
              fontSize: 18.sp,
              fontFamily: GStyles.fontOkine),
          errorStyle: TextStyle(color: GStyles.colorSecondary, fontSize: 16.sp),
        ),
        checkboxTheme: GStyles.checkBoxTheme,
        primaryColor: GStyles.colorPrimary,
        primaryColorDark: GStyles.colorPrimary,
        primaryColorLight: GStyles.colorPrimary,
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: GStyles.colorPrimary,
            secondary: GStyles.colorSecondary,
            onSecondaryContainer: GStyles.backgroundCircularIndicatorColor),
        primaryTextTheme: TextTheme(
          caption: TextStyle(color: Colors.white),
          bodyText1: GStyles.bodyText,
          headline1: GStyles.headline1,
          headline2: GStyles.headline2,
          headline3: GStyles.headline3,
          headline4: GStyles.headline4,
          headline5: GStyles.headline5,
          subtitle1: GStyles.textBottomNavigationBarItemSelectedStyle,
          subtitle2: GStyles.textBottomNavigationBarItemStyle,
          button: TextStyle(fontSize: 18.sp, color: GStyles.colorPrimary),
        ),
        textTheme: TextTheme(
          caption: TextStyle(color: Colors.white),
          bodyText1: GStyles.bodyText,
          headline1: GStyles.headline1,
          headline2: GStyles.headline2,
          headline3: GStyles.headline3,
          headline4: GStyles.headline4,
          headline5: GStyles.headline5,
          subtitle1: GStyles.textBottomNavigationBarItemSelectedStyle,
          subtitle2: GStyles.textBottomNavigationBarItemStyle,
          button: TextStyle(fontSize: 18.sp, color: GStyles.colorPrimary),
        ),
      );
}
