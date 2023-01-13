import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GStyles {
  ///Colors
  static Color get colorPrimary => const Color.fromARGB(255, 156, 12, 12);
  static Color get colorSecondary => const Color.fromRGBO(39, 81, 121, 1);
  static Color get colorSuccess => const Color.fromARGB(255, 17, 90, 20);
  static Color get colorFail => const Color.fromARGB(255, 156, 12, 12);
  static Color get colorInProgress => const Color.fromARGB(255, 21, 70, 116);
  static Color get backgroundCircularIndicatorColor =>
      const Color.fromARGB(255, 243, 243, 243);
  static Color get backGroundDarkColor => const Color.fromARGB(255, 31, 31, 31);

  ///Gradients
  static LinearGradient get barGradient => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [colorPrimary, colorSecondary],
      );

  ///Fonts
  static String get fontTeko => 'Teko';
  static String get fontEvilEmpire => 'EvilEmpire';

  ///DARK THEMES

  ///Text Styles
  static TextStyle get textBottomNavigationBarItemStyle => TextStyle(
        color: Colors.white.withOpacity(0.5),
        fontFamily: fontTeko,
        fontSize: 16.sp,
      );

  static TextStyle get textBottomNavigationBarItemSelectedStyle =>
      textBottomNavigationBarItemStyle.copyWith(color: Colors.white);

  static TextStyle get bodyText => TextStyle(
        fontSize: 18.sp,
        fontFamily: fontTeko,
        color: Colors.white,
      );

  static TextStyle get headline1 => TextStyle(
      fontSize: 32.sp, fontFamily: fontEvilEmpire, color: Colors.white);

  static TextStyle get headline2 => headline1.copyWith(
        fontSize: 28.sp,
      );

  static TextStyle get headline3 => headline1.copyWith(
        fontSize: 24.sp,
      );

  static TextStyle get headline4 => headline1.copyWith(
        fontSize: 20.sp,
      );

  static TextStyle get headline5 => headline1.copyWith(
        fontSize: 16.sp,
      );

  static TextStyle get adviceText => TextStyle(
      fontFamily: fontTeko, fontWeight: FontWeight.bold, fontSize: 16.sp);

  ///Themes
  static CheckboxThemeData get checkBoxTheme => CheckboxThemeData(
        fillColor: MaterialStateProperty.all(GStyles.colorPrimary),
      );

  static BoxShadow get boxShadowButton =>
      const BoxShadow(color: Colors.black26, blurRadius: 7, spreadRadius: 4);

  static BoxShadow get socialMediaShadowButton =>
      const BoxShadow(color: Colors.black12, blurRadius: 3, spreadRadius: 1);
}
