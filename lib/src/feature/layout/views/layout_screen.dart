import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:esports_cuba/src/shared/utils.dart';
import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:esports_cuba/resources/general_styles.dart';
import 'package:esports_cuba/src/feature/news/view/news_screen.dart';
import 'package:esports_cuba/src/feature/layout/bloc/navigation_cubit.dart';
import 'package:esports_cuba/src/feature/layout/constants/nav_bar_items.dart';
import 'package:esports_cuba/src/feature/tournament/views/tournament_screen.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: Material(
        child: Scaffold(
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: GStyles.colorPrimary,
                  ),
                  child: Text('Menú Principal',
                      style: context.textTheme.bodyText1
                          ?.copyWith(fontSize: 24.sp)),
                ),
                ListTile(
                  title: Text('Página 1',
                      style: context.textTheme.bodyText1
                          ?.copyWith(fontSize: 19.sp)),
                  onTap: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => Page1()));
                  },
                ),
                ListTile(
                  title: Text('Cerrar Menú',
                      style: context.textTheme.bodyText1
                          ?.copyWith(fontSize: 19.sp)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
          appBar: Utils.appBarWidget(context: context, navigateBack: false),
          body: BlocBuilder<NavigationCubit, NavigationState>(
              builder: (context, state) {
            switch (state.navbarItem) {
              case NavbarItem.home:
                return NewsScreen();
              case NavbarItem.tournament:
                return const TournamentScreen();

              case NavbarItem.profile:
                return Center(
                  child: Text(
                    context.loc.profile,
                    style: context.textTheme.headline1!
                        .copyWith(color: GStyles.colorPrimary),
                  ),
                );
            }
          }),
          bottomNavigationBar: bottomNavigationBarBuilder(context),
        ),
      ),
    );
  }

  Widget bottomNavigationBarBuilder(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
      return Container(
        child: BottomNavigationBar(
          currentIndex: state.index,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.5),
          selectedLabelStyle: context.textTheme.subtitle1,
          unselectedLabelStyle: context.textTheme.subtitle2,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.house,
                  size: 20.sp,
                ),
                activeIcon: FaIcon(
                  FontAwesomeIcons.house,
                  color: Colors.white,
                  size: 20.sp,
                ),
                label: context.loc.home),
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.trophy,
                  size: 20.sp,
                ),
                activeIcon: FaIcon(
                  FontAwesomeIcons.trophy,
                  size: 20.sp,
                  color: Colors.white,
                ),
                label: context.loc.tournament),
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.userAstronaut,
                  size: 20.sp,
                ),
                activeIcon: FaIcon(
                  FontAwesomeIcons.userAstronaut,
                  color: Colors.white,
                  size: 20.sp,
                ),
                label: context.loc.profile),
          ],
          onTap: (index) {
            switch (index) {
              case 0:
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.home);
                break;
              case 1:
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.tournament);
                break;
              case 2:
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.profile);
                break;
            }
          },
        ),
      );
    });
  }

  /* Widget drawerBuilder(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          GestureDetector(
            child: Text(
              'Auth',
              style: context.textTheme.headline3!
                  .copyWith(color: context.theme.primaryColor),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const AuthScreen();
              }));
            },
          ),
          GestureDetector(
            child: Text('Profile',
                style: context.textTheme.headline3!
                    .copyWith(color: context.theme.primaryColor)),
            onTap: () async {
              Navigator.of(context).pop();
              await Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) {
                return ProfileScreen(context);
              }));
            },
          )
        ],
      ),
    );
  }*/

  Widget bottomNavIcon(String icon, {bool opacity = false}) {
    return Image.asset(
      icon,
      height: 22.sp,
      width: 22.sp,
      color: Colors.white.withOpacity(opacity ? 0.5 : 1),
    );
  }
}
