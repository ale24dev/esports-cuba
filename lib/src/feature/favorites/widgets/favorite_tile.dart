import 'package:esports_cuba/constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:esports_cuba/src/shared/extensions.dart';

import '../../../../resources/general_styles.dart';

class FavoriteTile extends StatelessWidget {
  const FavoriteTile({
    Key? key,
    required this.name,
    required this.isLast,
  }) : super(key: key);

  ///Nombre del DrawerTile
  final String name;

  ///Determina si es el ultimo elemento de la lista
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GStyles.containerDarkColor,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Constants.MARGIN, vertical: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name,
                    style:
                        context.textTheme.bodyText1?.copyWith(fontSize: 16.sp)),
                const Icon(Icons.keyboard_arrow_right),
              ],
            ),
          ),
          !isLast
              ? Container(
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  height: 3.sp,
                  child: Divider(color: Colors.grey.withOpacity(.3)),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
