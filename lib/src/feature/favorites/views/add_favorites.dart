import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../constants.dart';
import '../../../../resources/general_styles.dart';
import 'package:esports_cuba/src/shared/utils.dart';
import '../widgets/add_bottom_category_section.dart.dart';


class AddFavorites extends StatelessWidget {
  const AddFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.appBarWidget(
          context: context, navigateBack: true, title: context.loc.favorites),
      body: Column(children: [
        Container(
          color: GStyles.containerDarkColor,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: Container(
              decoration: BoxDecoration(
                  color: GStyles.backGroundDarkColor,
                  borderRadius: BorderRadius.circular(5.0)),
              margin: EdgeInsets.symmetric(horizontal: Constants.MARGIN),
              child: Center(
                child: TextFormField(
                  decoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.grey),
                      hintText: context.loc.search,
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.transparent, width: 1.0)),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.transparent, width: 1.0))),
                ),
              ),
            ),
          ),
        ),
        const AddBottomFavoritesSection(),
      ]),
    );
  }
}
