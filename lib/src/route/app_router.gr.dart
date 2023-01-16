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
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../feature/auth/views/login_screen.dart' as _i3;
import '../feature/auth/views/register_user_screen.dart' as _i7;
import '../feature/auth/views/signup_screen.dart' as _i5;
import '../feature/favorites/views/favorite_screen.dart' as _i6;
import '../feature/layout/views/layout_screen.dart' as _i4;
import '../feature/news/view/news_details.dart' as _i2;
import '../feature/splash/views/splash_screen.dart' as _i1;
import '../models/news_base_model.dart' as _i10;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    NewsDetails.name: (routeData) {
      final args = routeData.argsAs<NewsDetailsArgs>();
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: _i2.NewsDetails(
          key: args.key,
          newsBaseModel: args.newsBaseModel,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginScreen.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.LoginScreen(),
      );
    },
    LayoutScreen.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.LayoutScreen(),
      );
    },
    SignupScreen.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.SignupScreen(),
      );
    },
    FavoritesScreen.name: (routeData) {
      final args = routeData.argsAs<FavoritesScreenArgs>(
          orElse: () => const FavoritesScreenArgs());
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.FavoritesScreen(key: args.key),
      );
    },
    RegisterUserScreen.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.RegisterUserScreen(),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          SplashScreen.name,
          path: '/',
        ),
        _i8.RouteConfig(
          NewsDetails.name,
          path: '/news-details',
        ),
        _i8.RouteConfig(
          LoginScreen.name,
          path: '/login-screen',
        ),
        _i8.RouteConfig(
          LayoutScreen.name,
          path: '/layout-screen',
        ),
        _i8.RouteConfig(
          SignupScreen.name,
          path: '/signup-screen',
        ),
        _i8.RouteConfig(
          FavoritesScreen.name,
          path: '/favorites-screen',
        ),
        _i8.RouteConfig(
          RegisterUserScreen.name,
          path: '/register-user-screen',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i8.PageRouteInfo<void> {
  const SplashScreen()
      : super(
          SplashScreen.name,
          path: '/',
        );

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.NewsDetails]
class NewsDetails extends _i8.PageRouteInfo<NewsDetailsArgs> {
  NewsDetails({
    _i9.Key? key,
    required _i10.NewsBaseModel newsBaseModel,
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

  final _i9.Key? key;

  final _i10.NewsBaseModel newsBaseModel;

  @override
  String toString() {
    return 'NewsDetailsArgs{key: $key, newsBaseModel: $newsBaseModel}';
  }
}

/// generated route for
/// [_i3.LoginScreen]
class LoginScreen extends _i8.PageRouteInfo<void> {
  const LoginScreen()
      : super(
          LoginScreen.name,
          path: '/login-screen',
        );

  static const String name = 'LoginScreen';
}

/// generated route for
/// [_i4.LayoutScreen]
class LayoutScreen extends _i8.PageRouteInfo<void> {
  const LayoutScreen()
      : super(
          LayoutScreen.name,
          path: '/layout-screen',
        );

  static const String name = 'LayoutScreen';
}

/// generated route for
/// [_i5.SignupScreen]
class SignupScreen extends _i8.PageRouteInfo<void> {
  const SignupScreen()
      : super(
          SignupScreen.name,
          path: '/signup-screen',
        );

  static const String name = 'SignupScreen';
}

/// generated route for
/// [_i6.FavoritesScreen]
class FavoritesScreen extends _i8.PageRouteInfo<FavoritesScreenArgs> {
  FavoritesScreen({_i9.Key? key})
      : super(
          FavoritesScreen.name,
          path: '/favorites-screen',
          args: FavoritesScreenArgs(key: key),
        );

  static const String name = 'FavoritesScreen';
}

class FavoritesScreenArgs {
  const FavoritesScreenArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'FavoritesScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.RegisterUserScreen]
class RegisterUserScreen extends _i8.PageRouteInfo<void> {
  const RegisterUserScreen()
      : super(
          RegisterUserScreen.name,
          path: '/register-user-screen',
        );

  static const String name = 'RegisterUserScreen';
}
