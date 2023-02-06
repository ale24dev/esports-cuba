import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../route/app_router.gr.dart';
import '../../../shared/utils.dart';
import '../widgets/favorite_tile.dart';
import 'package:esports_cuba/src/shared/extensions.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.appBarWidget(
          context: context, navigateBack: true, title: context.loc.favorites),
      body: Column(
        children: [
          SizedBox(height: 1.h),
          InkWell(
              onTap: () {
                context.router.replace(const AddFavorites());
              },
              child:
                  const FavoriteTile(name: "Añadir favorito", isLast: false)),
          InkWell(
              onTap: () {
                context.router.replace(ManageFavorites());
              },
              child:
                  const FavoriteTile(name: "Gestionar favoritos", isLast: true))
        ],
      ),
    );
  }
}
