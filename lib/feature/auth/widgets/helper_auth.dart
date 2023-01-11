import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../resources/general_styles.dart';

///Widget que se encarga de mostrar la ayuda en la vista de autorización
class HelperAuth extends StatelessWidget {
  const HelperAuth({
    Key? key,
    required this.text,
    required this.textButton,
    required this.functionCallback,
    required this.color,
  }) : super(key: key);

  ///Texto que muestra el widget
  final String text;

  ///Texto que se muestra en la acción
  final String textButton;

  ///Color del texto del widget
  final Color color;

  ///Función callback
  final Function functionCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 1.5.h),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold, color: color),
            ),
            SizedBox(width: 1.w),
            InkWell(
              child: Padding(
                padding: EdgeInsets.all(15.sp),
                child: Text(
                  textButton,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: GStyles.colorPrimary),
                ),
              ),
              onTap: () {
                functionCallback();
              },
            )
          ],
        ),
      ),
    );
  }
}
