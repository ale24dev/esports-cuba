import 'package:auto_route/annotations.dart';

import 'package:esports_cuba/src/feature/auth/views/login_screen.dart';
import 'package:esports_cuba/src/feature/auth/views/signup_screen.dart';
import 'package:esports_cuba/src/feature/bookmark/views/bookmark_screen.dart';
import 'package:esports_cuba/src/feature/layout/views/layout_screen.dart';
import 'package:esports_cuba/src/feature/news/view/news_details.dart';
import 'package:esports_cuba/src/feature/splash/views/splash_screen.dart';
import 'package:esports_cuba/src/feature/tournament/views/tournament_details.dart';

import '../feature/about/views/about_screen.dart';

///Rutas de la aplicación
/*@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: SplashScreen, initial: true),
    MaterialRoute(page: LayoutScreen),
    MaterialRoute(page: LoginScreen),
    MaterialRoute(page: RegisterScreen,),
  ],
  replaceInRouteName: 'Page,Route',
)
class $AppRouter {}
*/
@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: SplashScreen, initial: true),
    CustomRoute(page: NewsDetails),
    CustomRoute(page: TournamentDetails),
    MaterialRoute(page: LoginScreen),
    MaterialRoute(page: LayoutScreen),
    MaterialRoute(page: SignupScreen),
    MaterialRoute(page: BookmarkScreen),
    MaterialRoute(page: AboutScreen),
  ],
  replaceInRouteName: 'Page,Route',
)
class $AppRouter {}
