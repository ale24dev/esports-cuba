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
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../feature/auth/views/login_screen.dart' as _i5;
import '../feature/auth/views/register_screen.dart' as _i6;
import '../feature/favorites/views/favorite_screen.dart' as _i2;
import '../feature/layout/views/layout_screen.dart' as _i4;
import '../feature/news/view/news_details.dart' as _i1;
import '../feature/splash/views/splash_screen.dart' as _i3;
import '../models/news_base_model.dart' as _i9;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    NewsDetails.name: (routeData) {
      final args = routeData.argsAs<NewsDetailsArgs>();
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: _i1.NewsDetails(
          key: args.key,
          newsBaseModel: args.newsBaseModel,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    FavoritesScreen.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: _i2.FavoritesScreen(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    SplashScreen.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.SplashScreen(),
      );
    },
    LayoutScreen.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.LayoutScreen(),
      );
    },
    LoginScreen.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.LoginScreen(),
      );
    },
    RegisterScreen.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.RegisterScreen(),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          NewsDetails.name,
          path: '/news-details',
        ),
        _i7.RouteConfig(
          FavoritesScreen.name,
          path: '/favorites-screen',
        ),
        _i7.RouteConfig(
          SplashScreen.name,
          path: '/',
        ),
        _i7.RouteConfig(
          LayoutScreen.name,
          path: '/layout-screen',
        ),
        _i7.RouteConfig(
          LoginScreen.name,
          path: '/login-screen',
        ),
        _i7.RouteConfig(
          RegisterScreen.name,
          path: '/register-screen',
        ),
      ];
}

/// generated route for
/// [_i1.NewsDetails]
class NewsDetails extends _i7.PageRouteInfo<NewsDetailsArgs> {
  NewsDetails({
    _i8.Key? key,
    required _i9.NewsBaseModel newsBaseModel,
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

  final _i8.Key? key;

  final _i9.NewsBaseModel newsBaseModel;

  @override
  String toString() {
    return 'NewsDetailsArgs{key: $key, newsBaseModel: $newsBaseModel}';
  }
}

/// generated route for
/// [_i2.FavoritesScreen]
class FavoritesScreen extends _i7.PageRouteInfo<void> {
  const FavoritesScreen()
      : super(
          FavoritesScreen.name,
          path: '/favorites-screen',
        );

  static const String name = 'FavoritesScreen';
}

/// generated route for
/// [_i3.SplashScreen]
class SplashScreen extends _i7.PageRouteInfo<void> {
  const SplashScreen()
      : super(
          SplashScreen.name,
          path: '/',
        );

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i4.LayoutScreen]
class LayoutScreen extends _i7.PageRouteInfo<void> {
  const LayoutScreen()
      : super(
          LayoutScreen.name,
          path: '/layout-screen',
        );

  static const String name = 'LayoutScreen';
}

/// generated route for
/// [_i5.LoginScreen]
class LoginScreen extends _i7.PageRouteInfo<void> {
  const LoginScreen()
      : super(
          LoginScreen.name,
          path: '/login-screen',
        );

  static const String name = 'LoginScreen';
}

/// generated route for
/// [_i6.RegisterScreen]
class RegisterScreen extends _i7.PageRouteInfo<void> {
  const RegisterScreen()
      : super(
          RegisterScreen.name,
          path: '/register-screen',
        );

  static const String name = 'RegisterScreen';
}