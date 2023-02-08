import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'category_favorites.dart';
import 'list_popular_favorites.dart';
import '../constants/category_favorites.dart';
import '../../../../resources/general_styles.dart';
import 'package:esports_cuba/src/shared/extensions.dart';


class AddBottomFavoritesSection extends StatefulWidget {
  const AddBottomFavoritesSection({
    super.key,
  });

  @override
  State<AddBottomFavoritesSection> createState() =>
      _AddBottomFavoritesSectionState();
}

class _AddBottomFavoritesSectionState extends State<AddBottomFavoritesSection> {
  CategoryFavoritesEnum categoryFavoritesSelected = CategoryFavoritesEnum.ALL;

  voidCallback(CategoryFavoritesEnum categoryFavoritesSelected) {
    setState(() {
      this.categoryFavoritesSelected = categoryFavoritesSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            color: GStyles.containerDarkColor,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CategoryFavorites(
                    title: context.loc.all,
                    isSelected:
                        categoryFavoritesSelected == CategoryFavoritesEnum.ALL,
                    category: CategoryFavoritesEnum.ALL,
                    callback: voidCallback,
                  ),
                  CategoryFavorites(
                    title: context.loc.teams,
                    isSelected: categoryFavoritesSelected ==
                        CategoryFavoritesEnum.TEAMS,
                    category: CategoryFavoritesEnum.TEAMS,
                    callback: voidCallback,
                  ),
                  CategoryFavorites(
                    title: context.loc.tournament,
                    isSelected: categoryFavoritesSelected ==
                        CategoryFavoritesEnum.TOURNAMENTS,
                    category: CategoryFavoritesEnum.TOURNAMENTS,
                    callback: voidCallback,
                  ),
                  CategoryFavorites(
                    title: context.loc.players,
                    isSelected: categoryFavoritesSelected ==
                        CategoryFavoritesEnum.PLAYERS,
                    category: CategoryFavoritesEnum.PLAYERS,
                    callback: voidCallback,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 2.h),
          ListPopularFavorites(categorySelected: categoryFavoritesSelected)
        ],
      ),
    );
    /*return Container(
      height: ,
      child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: Constants.MARGIN, vertical: 1.h),
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: listCategories.length,
              itemBuilder: (_, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      indexSelected = index;
                    });
                  },
                  child: CategoryFavorites(
                    title: listCategories[index],
                    isSelected: index == indexSelected,
                  ),
                );
              })),
    );*/
  }
}

