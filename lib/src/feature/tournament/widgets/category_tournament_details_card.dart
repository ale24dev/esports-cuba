import 'package:esports_cuba/src/feature/tournament/bloc/tournament_cubit.dart';
import 'package:esports_cuba/src/feature/tournament/constants/category_tournament_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../resources/general_styles.dart';
import 'package:esports_cuba/src/shared/extensions.dart';

class CategoryTournamentDetailsCard extends StatelessWidget {
  const CategoryTournamentDetailsCard({
    Key? key,
    required this.title,
    required this.category,
    required this.selected,
    required this.callback,
  }) : super(key: key);

  ///Título de la categoría
  final String title;

  ///Categoria de cada elemento
  final CategoryTournamentDetailsEnum category;

  ///Determina si el elemento fue seleccionado
  final bool selected;

  ///Function callback
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callback(category);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 1.5.w),
        decoration: BoxDecoration(
            color: selected ? GStyles.colorPrimary : GStyles.containerDarkColor,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 2, spreadRadius: 2)
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: context.textTheme.bodyText1?.copyWith(
                color: selected ? Colors.white : Colors.grey,
                fontWeight: selected ? FontWeight.bold : FontWeight.normal),
          ),
        ),
      ),
    );
  }
}
