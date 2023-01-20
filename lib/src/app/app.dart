import 'dart:async';

import 'package:esports_cuba/src/feature/drawer/cubit/drawer_cubit.dart';
import 'package:esports_cuba/src/shared/connectivity.dart';
import 'package:esports_cuba/src/shared/constants/connectivity_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:esports_cuba/src/route/app_router.gr.dart';
import 'package:esports_cuba/src/feature/auth/bloc/auth_cubit.dart';
import 'package:esports_cuba/src/feature/news/bloc/news_cubit.dart';
import 'package:esports_cuba/src/feature/tournament/bloc/game_cubit.dart';
import 'package:esports_cuba/src/feature/favorites/bloc/favorites_cubit.dart';
import 'package:esports_cuba/src/feature/tournament/bloc/tournament_cubit.dart';

import '../../resources/themes.dart';

final supabase = Supabase.instance.client;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final StreamSubscription<AuthState> _authSubscription;
  User? _user;
  final _appRouter = AppRouter();

  @override
  void initState() {
    /*_authSubscription = supabase.auth.onAuthStateChange.listen((data) {
      print("22222222222");
      final AuthChangeEvent event = data.event;
      final Session? session = data.session;
      if (event == AuthChangeEvent.signedIn) {
        if (session != null) {
          _appRouter
            ..popUntilRoot()
            ..replace(const LayoutScreen());
        } else {
          print("SignOut");
          // getIt<AuthRepository>().signOut();
        }
      } else if (event == AuthChangeEvent.signedOut) {
        _appRouter
          ..popUntilRoot()
          ..replace(const LoginScreen());
      }
      /* setState(() {
        _user = session?.user;
      });*/
    });*/
    super.initState();
  }

  @override
  void dispose() {
    _authSubscription.cancel();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MultiRepositoryProvider(
        providers: [
          //RepositoryProvider<AuthCubit>(create: (context) => AuthCubit()),
          RepositoryProvider<GameCubit>(create: (context) => GameCubit()),
          RepositoryProvider<TournamentCubit>(
              create: (context) => TournamentCubit()),
          RepositoryProvider<NewsCubit>(create: (context) => NewsCubit()),
          RepositoryProvider<FavoritesCubit>(
              create: (context) => FavoritesCubit()),
          RepositoryProvider<DrawerCubit>(create: (context) => DrawerCubit()),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            // 'en' is the language code. We could optionally provide a
            // a country code as the second param, e.g.
            // Locale('en', 'US'). If we do that, we may want to
            // provide an additional app_en_US.arb file for
            // region-specific translations.
            // Locale('en', ''),
            Locale('es', ''),
          ],
          title: 'Esports Cuba',
          theme: Themes.darkTheme,
          /*themeMode: ThemeMode.dark,
          theme: AppThemes.appThemes[ThemeMode.dark],
          darkTheme: AppThemes.appThemes[ThemeMode.dark],*/
        ),
      );
    });
  }
}
