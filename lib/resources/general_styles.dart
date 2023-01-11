import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GStyles {
  ///Colors
  static Color get colorPrimary => Color.fromARGB(255, 156, 12, 12);
  static Color get colorSecondary => const Color.fromRGBO(39, 81, 121, 1);
  static Color get backgroundCircularIndicatorColor =>
      const Color.fromARGB(255, 243, 243, 243);
  static Color get backGroundDarkColor => Color.fromARGB(255, 31, 31, 31);

  ///Gradients
  static LinearGradient get barGradient => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [colorPrimary, colorSecondary],
      );

  ///Fonts
  static String get fontOkine => 'Okine';
  static String get fontMorganite => 'Morganite';

  ///DARK THEMES

  ///Text Styles
  static TextStyle get textBottomNavigationBarItemStyle => TextStyle(
        color: Colors.white.withOpacity(0.5),
        fontFamily: fontOkine,
        fontSize: 13.sp,
      );

  static TextStyle get textBottomNavigationBarItemSelectedStyle =>
      textBottomNavigationBarItemStyle.copyWith(color: Colors.white);

  static TextStyle get bodyText => TextStyle(
        fontSize: 16.sp,
        fontFamily: fontOkine,
        color: Colors.white,
      );

  static TextStyle get headline1 =>
      TextStyle(fontSize: 32.sp, fontFamily: fontOkine, color: Colors.white);

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
      fontFamily: 'GraphikArabic',
      fontWeight: FontWeight.bold,
      fontSize: 16.sp);

  ///Themes
  static CheckboxThemeData get checkBoxTheme => CheckboxThemeData(
        fillColor: MaterialStateProperty.all(GStyles.colorPrimary),
      );

  static BoxShadow get boxShadowButton =>
      const BoxShadow(color: Colors.black26, blurRadius: 7, spreadRadius: 4);

  static BoxShadow get socialMediaShadowButton =>
      const BoxShadow(color: Colors.black12, blurRadius: 3, spreadRadius: 1);
}
