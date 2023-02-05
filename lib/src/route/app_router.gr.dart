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
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../feature/about/views/about_screen.dart' as _i8;
import '../feature/auth/views/login_screen.dart' as _i4;
import '../feature/auth/views/signup_screen.dart' as _i6;
import '../feature/bookmark/views/bookmark_screen.dart' as _i7;
import '../feature/layout/views/layout_screen.dart' as _i5;
import '../feature/news/view/news_details.dart' as _i2;
import '../feature/splash/views/splash_screen.dart' as _i1;
import '../feature/tournament/views/tournament_details.dart' as _i3;
import '../models/news_base_model.dart' as _i11;
import '../models/tournament_base_model.dart' as _i12;
import '../models/version_base_model.dart' as _i13;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    NewsDetails.name: (routeData) {
      final args = routeData.argsAs<NewsDetailsArgs>();
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: _i2.NewsDetails(
          key: args.key,
          newsBaseModel: args.newsBaseModel,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    TournamentDetails.name: (routeData) {
      final args = routeData.argsAs<TournamentDetailsArgs>();
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: _i3.TournamentDetails(
          key: args.key,
          tournamentBaseModel: args.tournamentBaseModel,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginScreen.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.LoginScreen(),
      );
    },
    LayoutScreen.name: (routeData) {
      final args = routeData.argsAs<LayoutScreenArgs>(
          orElse: () => const LayoutScreenArgs());
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: _i5.LayoutScreen(
          key: args.key,
          versionBaseModel: args.versionBaseModel,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    SignupScreen.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.SignupScreen(),
      );
    },
    BookmarkScreen.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.BookmarkScreen(),
      );
    },
    AboutScreen.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.AboutScreen(),
      );
    },
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(
          SplashScreen.name,
          path: '/',
        ),
        _i9.RouteConfig(
          NewsDetails.name,
          path: '/news-details',
        ),
        _i9.RouteConfig(
          TournamentDetails.name,
          path: '/tournament-details',
        ),
        _i9.RouteConfig(
          LoginScreen.name,
          path: '/login-screen',
        ),
        _i9.RouteConfig(
          LayoutScreen.name,
          path: '/layout-screen',
        ),
        _i9.RouteConfig(
          SignupScreen.name,
          path: '/signup-screen',
        ),
        _i9.RouteConfig(
          BookmarkScreen.name,
          path: '/bookmark-screen',
        ),
        _i9.RouteConfig(
          AboutScreen.name,
          path: '/about-screen',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i9.PageRouteInfo<void> {
  const SplashScreen()
      : super(
          SplashScreen.name,
          path: '/',
        );

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.NewsDetails]
class NewsDetails extends _i9.PageRouteInfo<NewsDetailsArgs> {
  NewsDetails({
    _i10.Key? key,
    required _i11.NewsBaseModel newsBaseModel,
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

  final _i10.Key? key;

  final _i11.NewsBaseModel newsBaseModel;

  @override
  String toString() {
    return 'NewsDetailsArgs{key: $key, newsBaseModel: $newsBaseModel}';
  }
}

/// generated route for
/// [_i3.TournamentDetails]
class TournamentDetails extends _i9.PageRouteInfo<TournamentDetailsArgs> {
  TournamentDetails({
    _i10.Key? key,
    required _i12.TournamentBaseModel tournamentBaseModel,
  }) : super(
          TournamentDetails.name,
          path: '/tournament-details',
          args: TournamentDetailsArgs(
            key: key,
            tournamentBaseModel: tournamentBaseModel,
          ),
        );

  static const String name = 'TournamentDetails';
}

class TournamentDetailsArgs {
  const TournamentDetailsArgs({
    this.key,
    required this.tournamentBaseModel,
  });

  final _i10.Key? key;

  final _i12.TournamentBaseModel tournamentBaseModel;

  @override
  String toString() {
    return 'TournamentDetailsArgs{key: $key, tournamentBaseModel: $tournamentBaseModel}';
  }
}

/// generated route for
/// [_i4.LoginScreen]
class LoginScreen extends _i9.PageRouteInfo<void> {
  const LoginScreen()
      : super(
          LoginScreen.name,
          path: '/login-screen',
        );

  static const String name = 'LoginScreen';
}

/// generated route for
/// [_i5.LayoutScreen]
class LayoutScreen extends _i9.PageRouteInfo<LayoutScreenArgs> {
  LayoutScreen({
    _i10.Key? key,
    _i13.VersionBaseModel? versionBaseModel,
  }) : super(
          LayoutScreen.name,
          path: '/layout-screen',
          args: LayoutScreenArgs(
            key: key,
            versionBaseModel: versionBaseModel,
          ),
        );

  static const String name = 'LayoutScreen';
}

class LayoutScreenArgs {
  const LayoutScreenArgs({
    this.key,
    this.versionBaseModel,
  });

  final _i10.Key? key;

  final _i13.VersionBaseModel? versionBaseModel;

  @override
  String toString() {
    return 'LayoutScreenArgs{key: $key, versionBaseModel: $versionBaseModel}';
  }
}

/// generated route for
/// [_i6.SignupScreen]
class SignupScreen extends _i9.PageRouteInfo<void> {
  const SignupScreen()
      : super(
          SignupScreen.name,
          path: '/signup-screen',
        );

  static const String name = 'SignupScreen';
}

/// generated route for
/// [_i7.BookmarkScreen]
class BookmarkScreen extends _i9.PageRouteInfo<void> {
  const BookmarkScreen()
      : super(
          BookmarkScreen.name,
          path: '/bookmark-screen',
        );

  static const String name = 'BookmarkScreen';
}

/// generated route for
/// [_i8.AboutScreen]
class AboutScreen extends _i9.PageRouteInfo<void> {
  const AboutScreen()
      : super(
          AboutScreen.name,
          path: '/about-screen',
        );

  static const String name = 'AboutScreen';
}
