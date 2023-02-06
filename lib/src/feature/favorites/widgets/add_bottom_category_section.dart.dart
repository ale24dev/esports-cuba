import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CategoryFavorites(
            title: "Todos",
            isSelected: categoryFavoritesSelected == CategoryFavoritesEnum.ALL,
            category: CategoryFavoritesEnum.ALL,
            callback: voidCallback,
          ),
          CategoryFavorites(
            title: "Equipos",
            isSelected:
                categoryFavoritesSelected == CategoryFavoritesEnum.TEAMS,
            category: CategoryFavoritesEnum.TEAMS,
            callback: voidCallback,
          ),
          CategoryFavorites(
            title: context.loc.tournament,
            isSelected:
                categoryFavoritesSelected == CategoryFavoritesEnum.TOURNAMENTS,
            category: CategoryFavoritesEnum.TOURNAMENTS,
            callback: voidCallback,
          ),
          CategoryFavorites(
            title: "Jugadores",
            isSelected:
                categoryFavoritesSelected == CategoryFavoritesEnum.PLAYERS,
            category: CategoryFavoritesEnum.PLAYERS,
            callback: voidCallback,
          ),
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

class CategoryFavorites extends StatelessWidget {
  const CategoryFavorites({
    super.key,
    required this.title,
    required this.isSelected,
    required this.callback,
    required this.category,
  });

  ///Título de la categoría
  final String title;

  ///Bandera que determina si esta seleccionada la categoría
  final bool isSelected;

  ///Categoría
  final CategoryFavoritesEnum category;

  ///Function callback
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        callback(category);
      },
      child: Container(
        decoration: BoxDecoration(
            color:
                isSelected ? GStyles.colorPrimary : GStyles.backGroundDarkColor,
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: context.textTheme.bodyText1?.copyWith(
                color: isSelected ? Colors.white : Colors.grey,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal),
          ),
        ),
      ),
    );
  }
}
