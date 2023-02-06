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
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;

import '../feature/about/views/about_screen.dart' as _i11;
import '../feature/auth/views/login_screen.dart' as _i2;
import '../feature/auth/views/signup_screen.dart' as _i3;
import '../feature/bookmark/views/bookmark_screen.dart' as _i9;
import '../feature/favorites/views/add_favorites.dart' as _i10;
import '../feature/favorites/views/favorites_screen.dart' as _i7;
import '../feature/favorites/views/manage_favorites.dart' as _i8;
import '../feature/layout/views/layout_screen.dart' as _i4;
import '../feature/news/view/news_details.dart' as _i5;
import '../feature/splash/views/splash_screen.dart' as _i1;
import '../feature/tournament/views/tournament_details.dart' as _i6;
import '../models/news_base_model.dart' as _i15;
import '../models/tournament_base_model.dart' as _i16;
import '../models/version_base_model.dart' as _i14;

class AppRouter extends _i12.RootStackRouter {
  AppRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    LoginScreen.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.LoginScreen(),
      );
    },
    SignupScreen.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.SignupScreen(),
      );
    },
    LayoutScreen.name: (routeData) {
      final args = routeData.argsAs<LayoutScreenArgs>(
          orElse: () => const LayoutScreenArgs());
      return _i12.CustomPage<dynamic>(
        routeData: routeData,
        child: _i4.LayoutScreen(
          key: args.key,
          versionBaseModel: args.versionBaseModel,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    NewsDetails.name: (routeData) {
      final args = routeData.argsAs<NewsDetailsArgs>();
      return _i12.CustomPage<dynamic>(
        routeData: routeData,
        child: _i5.NewsDetails(
          key: args.key,
          newsBaseModel: args.newsBaseModel,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    TournamentDetails.name: (routeData) {
      final args = routeData.argsAs<TournamentDetailsArgs>();
      return _i12.CustomPage<dynamic>(
        routeData: routeData,
        child: _i6.TournamentDetails(
          key: args.key,
          tournamentBaseModel: args.tournamentBaseModel,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    FavoritesScreen.name: (routeData) {
      return _i12.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i7.FavoritesScreen(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ManageFavorites.name: (routeData) {
      final args = routeData.argsAs<ManageFavoritesArgs>(
          orElse: () => const ManageFavoritesArgs());
      return _i12.CustomPage<dynamic>(
        routeData: routeData,
        child: _i8.ManageFavorites(key: args.key),
        opaque: true,
        barrierDismissible: false,
      );
    },
    BookmarkScreen.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.BookmarkScreen(),
      );
    },
    AddFavorites.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.AddFavorites(),
      );
    },
    AboutScreen.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.AboutScreen(),
      );
    },
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig(
          SplashScreen.name,
          path: '/',
        ),
        _i12.RouteConfig(
          LoginScreen.name,
          path: '/login-screen',
        ),
        _i12.RouteConfig(
          SignupScreen.name,
          path: '/signup-screen',
        ),
        _i12.RouteConfig(
          LayoutScreen.name,
          path: '/layout-screen',
        ),
        _i12.RouteConfig(
          NewsDetails.name,
          path: '/news-details',
        ),
        _i12.RouteConfig(
          TournamentDetails.name,
          path: '/tournament-details',
        ),
        _i12.RouteConfig(
          FavoritesScreen.name,
          path: '/favorites-screen',
        ),
        _i12.RouteConfig(
          ManageFavorites.name,
          path: '/manage-favorites',
        ),
        _i12.RouteConfig(
          BookmarkScreen.name,
          path: '/bookmark-screen',
        ),
        _i12.RouteConfig(
          AddFavorites.name,
          path: '/add-favorites',
        ),
        _i12.RouteConfig(
          AboutScreen.name,
          path: '/about-screen',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i12.PageRouteInfo<void> {
  const SplashScreen()
      : super(
          SplashScreen.name,
          path: '/',
        );

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreen extends _i12.PageRouteInfo<void> {
  const LoginScreen()
      : super(
          LoginScreen.name,
          path: '/login-screen',
        );

  static const String name = 'LoginScreen';
}

/// generated route for
/// [_i3.SignupScreen]
class SignupScreen extends _i12.PageRouteInfo<void> {
  const SignupScreen()
      : super(
          SignupScreen.name,
          path: '/signup-screen',
        );

  static const String name = 'SignupScreen';
}

/// generated route for
/// [_i4.LayoutScreen]
class LayoutScreen extends _i12.PageRouteInfo<LayoutScreenArgs> {
  LayoutScreen({
    _i13.Key? key,
    _i14.VersionBaseModel? versionBaseModel,
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

  final _i13.Key? key;

  final _i14.VersionBaseModel? versionBaseModel;

  @override
  String toString() {
    return 'LayoutScreenArgs{key: $key, versionBaseModel: $versionBaseModel}';
  }
}

/// generated route for
/// [_i5.NewsDetails]
class NewsDetails extends _i12.PageRouteInfo<NewsDetailsArgs> {
  NewsDetails({
    _i13.Key? key,
    required _i15.NewsBaseModel newsBaseModel,
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

  final _i13.Key? key;

  final _i15.NewsBaseModel newsBaseModel;

  @override
  String toString() {
    return 'NewsDetailsArgs{key: $key, newsBaseModel: $newsBaseModel}';
  }
}

/// generated route for
/// [_i6.TournamentDetails]
class TournamentDetails extends _i12.PageRouteInfo<TournamentDetailsArgs> {
  TournamentDetails({
    _i13.Key? key,
    required _i16.TournamentBaseModel tournamentBaseModel,
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

  final _i13.Key? key;

  final _i16.TournamentBaseModel tournamentBaseModel;

  @override
  String toString() {
    return 'TournamentDetailsArgs{key: $key, tournamentBaseModel: $tournamentBaseModel}';
  }
}

/// generated route for
/// [_i7.FavoritesScreen]
class FavoritesScreen extends _i12.PageRouteInfo<void> {
  const FavoritesScreen()
      : super(
          FavoritesScreen.name,
          path: '/favorites-screen',
        );

  static const String name = 'FavoritesScreen';
}

/// generated route for
/// [_i8.ManageFavorites]
class ManageFavorites extends _i12.PageRouteInfo<ManageFavoritesArgs> {
  ManageFavorites({_i13.Key? key})
      : super(
          ManageFavorites.name,
          path: '/manage-favorites',
          args: ManageFavoritesArgs(key: key),
        );

  static const String name = 'ManageFavorites';
}

class ManageFavoritesArgs {
  const ManageFavoritesArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'ManageFavoritesArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.BookmarkScreen]
class BookmarkScreen extends _i12.PageRouteInfo<void> {
  const BookmarkScreen()
      : super(
          BookmarkScreen.name,
          path: '/bookmark-screen',
        );

  static const String name = 'BookmarkScreen';
}

/// generated route for
/// [_i10.AddFavorites]
class AddFavorites extends _i12.PageRouteInfo<void> {
  const AddFavorites()
      : super(
          AddFavorites.name,
          path: '/add-favorites',
        );

  static const String name = 'AddFavorites';
}

/// generated route for
/// [_i11.AboutScreen]
class AboutScreen extends _i12.PageRouteInfo<void> {
  const AboutScreen()
      : super(
          AboutScreen.name,
          path: '/about-screen',
        );

  static const String name = 'AboutScreen';
}
