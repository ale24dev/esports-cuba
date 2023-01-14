// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../feature/auth/views/login_screen.dart' as _i4;
import '../feature/auth/views/register_screen.dart' as _i5;
import '../feature/layout/views/layout_screen.dart' as _i3;
import '../feature/news/view/news_details.dart' as _i1;
import '../feature/splash/views/splash_screen.dart' as _i2;
import '../models/news_base_model.dart' as _i8;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    NewsDetails.name: (routeData) {
      final args = routeData.argsAs<NewsDetailsArgs>();
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: _i1.NewsDetails(
          key: args.key,
          newsBaseModel: args.newsBaseModel,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    SplashScreen.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.SplashScreen(),
      );
    },
    LayoutScreen.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.LayoutScreen(),
      );
    },
    LoginScreen.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.LoginScreen(),
      );
    },
    RegisterScreen.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.RegisterScreen(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          NewsDetails.name,
          path: '/news-details',
        ),
        _i6.RouteConfig(
          SplashScreen.name,
          path: '/',
        ),
        _i6.RouteConfig(
          LayoutScreen.name,
          path: '/layout-screen',
        ),
        _i6.RouteConfig(
          LoginScreen.name,
          path: '/login-screen',
        ),
        _i6.RouteConfig(
          RegisterScreen.name,
          path: '/register-screen',
        ),
      ];
}

/// generated route for
/// [_i1.NewsDetails]
class NewsDetails extends _i6.PageRouteInfo<NewsDetailsArgs> {
  NewsDetails({
    _i7.Key? key,
    required _i8.NewsBaseModel newsBaseModel,
  }) : super(
          NewsDetails.name,
          path: '/news-details',
          args: NewsDetailsArgs(
            key: key,
            newsBaseModel: newsBaseModel,
          ),
        );

  static const String name = 'NewsDetails';
}

class NewsDetailsArgs {
  const NewsDetailsArgs({
    this.key,
    required this.newsBaseModel,
  });

  final _i7.Key? key;

  final _i8.NewsBaseModel newsBaseModel;

  @override
  String toString() {
    return 'NewsDetailsArgs{key: $key, newsBaseModel: $newsBaseModel}';
  }
}

/// generated route for
/// [_i2.SplashScreen]
class SplashScreen extends _i6.PageRouteInfo<void> {
  const SplashScreen()
      : super(
          SplashScreen.name,
          path: '/',
        );

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i3.LayoutScreen]
class LayoutScreen extends _i6.PageRouteInfo<void> {
  const LayoutScreen()
      : super(
          LayoutScreen.name,
          path: '/layout-screen',
        );

  static const String name = 'LayoutScreen';
}

/// generated route for
/// [_i4.LoginScreen]
class LoginScreen extends _i6.PageRouteInfo<void> {
  const LoginScreen()
      : super(
          LoginScreen.name,
          path: '/login-screen',
        );

  static const String name = 'LoginScreen';
}

/// generated route for
/// [_i5.RegisterScreen]
class RegisterScreen extends _i6.PageRouteInfo<void> {
  const RegisterScreen()
      : super(
          RegisterScreen.name,
          path: '/register-screen',
        );

  static const String name = 'RegisterScreen';
}
