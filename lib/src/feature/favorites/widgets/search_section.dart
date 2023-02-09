import 'package:esports_cuba/src/feature/favorites/bloc/search/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../constants.dart';
import '../../../shared/loading_app.dart';
import '../constants/category_search.dart';
import '../../../../resources/general_styles.dart';
import 'package:esports_cuba/src/shared/extensions.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({
    super.key,
    required this.categorySearch,
  });

  ///Estado actual de la búsqueda
  final CategorySearch categorySearch;

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  late TextEditingController searchEditingController;
  @override
  void initState() {
    searchEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
              autocorrect: false,
              decoration: InputDecoration(
                  hintStyle: const TextStyle(color: Colors.grey),
                  hintText: context.loc.search,
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  suffixIcon: widget.categorySearch == CategorySearch.LOADING
                      ? SizedBox(
                          width: 8.sp,
                          height: 8.sp,
                          child: Center(child: LoadingApp(size: 14.sp)))
                      : widget.categorySearch == CategorySearch.LOADED || widget.categorySearch == CategorySearch.EMPTYRESULT
                          ? GestureDetector(
                              onTap: () {
                                searchEditingController.clear();
                                //searchEditingController.text = "";
                                context
                                    .read<SearchCubit>()
                                    .cleanSearchEditingController();
                              },
                              child: SizedBox(
                                  width: 5.sp,
                                  height: 5.sp,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: GStyles.containerDarkColor,
                                            shape: BoxShape.circle),
                                        child: Center(
                                            child: FaIcon(FontAwesomeIcons.x,
                                                size: 12.sp,
                                                color: Colors.white))),
                                  )),
                            )
                          : const SizedBox.shrink(),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 1.0)),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 1.0))),
              controller: searchEditingController,
              onChanged: (text) {
                context.read<SearchCubit>().typingMesage(text);
              },
            ),
          ),
        ),
      ),
    );
  }
}
