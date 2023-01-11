import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:esports_cuba/route/app_router.gr.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:esports_cuba/feature/auth/bloc/auth_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../resources/themes.dart';

class MyApp extends StatelessWidget {
  /// Attribute to identify if the app is on foreground to display a notification
  /// dialog.
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AuthCubit>(create: (context) => AuthCubit()),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerDelegate: appRouter.delegate(),
          routeInformationParser: appRouter.defaultRouteParser(),
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
          title: 'HallMed',
          theme: Themes.darkTheme,
          /*themeMode: ThemeMode.dark,
          theme: AppThemes.appThemes[ThemeMode.dark],
          darkTheme: AppThemes.appThemes[ThemeMode.dark],*/
        ),
      );
    });
  }
}
