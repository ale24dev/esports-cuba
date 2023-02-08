import 'package:esports_cuba/src/feature/favorites/bloc/favorites_cubit.dart';
import 'package:esports_cuba/src/models/player_base_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../constants.dart';
import '../../../../resources/general_styles.dart';
import 'package:esports_cuba/src/shared/extensions.dart';

class FavoritesCard extends StatelessWidget {
  const FavoritesCard({
    super.key,
    required this.favorite,
    required this.index,
    required this.isLastIndex,
  });

  final dynamic favorite;

  ///Indice actual en la lista
  final int index;

  ///bandera que indica si es el ultimo elemento de la lista
  final bool isLastIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Constants.MARGIN),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 28.sp,
                width: 28.sp,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(favorite.image),
                ),
              ),
              SizedBox(width: 4.w),
              Expanded(
                  child: Text(
                favorite is PlayerBaseModel ? favorite.nickname : favorite.name,
                style: context.textTheme.bodyText1,
                textAlign: TextAlign.start,
              )),
              GestureDetector(
                onTap: () {
                  context
                      .read<FavoritesCubit>()
                      .removeLocalFavoriteToUser(favorite, context);
                },
                child: Container(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FaIcon(FontAwesomeIcons.solidHeart,
                        color: GStyles.colorFail, size: 19.sp),
                  ),
                ),
              )
            ],
          ),
        ),
        !isLastIndex
            ? Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                child: const Divider(
                  color: Colors.white10,
                ))
            : const SizedBox.shrink()
      ],
    );
  }
}
