import 'package:auto_route/annotations.dart';

import '../feature/about/views/about_screen.dart';
import '../feature/auth/views/login_screen.dart';
import '../feature/auth/views/signup_screen.dart';
import '../feature/bookmark/views/bookmark_screen.dart';
import '../feature/favorites/views/add_favorites.dart';
import '../feature/favorites/views/favorites_screen.dart';
import '../feature/favorites/views/manage_favorites.dart';
import '../feature/layout/views/layout_screen.dart';
import '../feature/news/view/news_details.dart';
import '../feature/splash/views/splash_screen.dart';
import '../feature/tournament/views/tournament_details.dart';

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
    MaterialRoute(page: LoginScreen),
    MaterialRoute(page: SignupScreen),
    CustomRoute(page: LayoutScreen),
    CustomRoute(page: NewsDetails),
    CustomRoute(page: TournamentDetails),
    CustomRoute(page: FavoritesScreen),
    CustomRoute(page: ManageFavorites),
    MaterialRoute(page: BookmarkScreen),
    MaterialRoute(page: AddFavorites),
    MaterialRoute(page: AboutScreen),
  ],
  replaceInRouteName: 'Page,Route',
)
class $AppRouter {}
