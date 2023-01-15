import 'package:flutter/material.dart';

class GenericButton extends StatelessWidget {
  ///Texto a mostrar en el botón
  final String text;

  ///Texto a mostrar en el botón
  final Color textColor;

  ///Funcion callback
  final Function callback;

  ///Color a mostrar en el botón
  final Color color;

  const GenericButton({
    Key? key,
    required this.text,
    required this.callback,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            return color;
          }),
        ),
        onPressed: () {
          callback();
        },
        child: Text(text, style: TextStyle(color: textColor)));
  }
}
