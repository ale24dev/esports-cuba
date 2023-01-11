import 'package:auto_route/annotations.dart';

import 'package:esports_cuba/feature/auth/views/login_screen.dart';
import 'package:esports_cuba/feature/home/view/home_screen.dart';
import 'package:esports_cuba/feature/auth/views/register_screen.dart';
import 'package:esports_cuba/feature/splash/views/splash_screen.dart';

///Rutas de la aplicación
@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: SplashScreen, initial: true),
    MaterialRoute(page: HomeScreen),
    MaterialRoute(page: LoginScreen),
    MaterialRoute(page: RegisterScreen)
  ],
  replaceInRouteName: 'Page,Route',
)
class $AppRouter {}
