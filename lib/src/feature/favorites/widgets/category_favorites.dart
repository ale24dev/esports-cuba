import 'package:flutter/material.dart';

import '../constants/category_favorites.dart';
import '../../../../resources/general_styles.dart';
import 'package:esports_cuba/src/shared/extensions.dart';

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
                isSelected ? GStyles.colorPrimary : GStyles.containerDarkColor,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 2, spreadRadius: 2)
            ]),
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
