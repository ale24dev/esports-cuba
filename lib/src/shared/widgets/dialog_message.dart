import 'package:auto_route/auto_route.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:esports_cuba/src/shared/loading_app.dart';
import 'package:esports_cuba/resources/general_styles.dart';
import 'package:esports_cuba/src/shared/widgets/generic_button.dart';

class DialogMessage extends StatelessWidget {
  const DialogMessage({
    Key? key,
    required this.title,
    required this.text,
    required this.withTranslate,
  }) : super(key: key);

  ///Título del Dialog
  final String title;

  ///Texto del Dialog
  final String text;

  ///Bandera que define si el texto ingresado necesita tradución al lenguaje actual
  final bool withTranslate;

  @override
  Widget build(BuildContext context) {
    final translator = GoogleTranslator();

    return !withTranslate
        ? dialog(context, text)
        : FutureBuilder(
            future: translator.translate(text, to: context.currentLanguage),
            builder: ((context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const LoadingApp();
              }
              Translation translation = snapshot.data;
              return dialog(context, translation.text);
            }));
  }

  Widget dialog(BuildContext context, String text) {
    return AlertDialog(
      title: Text(
        title,
        style: context.textTheme.headline3,
      ),
      backgroundColor: GStyles.backGroundDarkColor,
      content: Text(
        Intl.message(text),
        style: const TextStyle(color: Colors.white),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GenericButton(
                text: context.loc.accept,
                textColor: Colors.white,
                color: const Color.fromARGB(255, 112, 110, 110),
                callback: () {
                  context.router.pop();
                }),
          ],
        ),
      ],
    );
  }
}
