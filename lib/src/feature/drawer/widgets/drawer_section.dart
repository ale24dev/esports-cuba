import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:esports_cuba/resources/general_styles.dart';
import 'package:esports_cuba/src/feature/drawer/widgets/drawer_tile.dart';

class DrawerSection extends StatelessWidget {
  const DrawerSection({
    Key? key,
    required this.listDrawerTile, required this.title,
  }) : super(key: key);

  ///Lista de elementos
  final List<String> listDrawerTile;

  ///Titulo de la sección
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(color: Colors.grey, fontSize: 14.sp)),
          SizedBox(height: 1.h),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: GStyles.containerDarkColor,
                borderRadius: BorderRadius.circular(5.0)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: listDrawerTile.map((name) {
                  return DrawerTile(
                    name: name,
                    isLast: listDrawerTile.last == name ? true : false,
                  );
                }).toList()),
          ),
        ],
      ),
    );
  }
}
