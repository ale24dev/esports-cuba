import 'package:flutter/material.dart';

import 'package:esports_cuba/resources/general_styles.dart';

class GenericSnackBar extends StatelessWidget {
  const GenericSnackBar({super.key, required this.message, this.duration});

  ///Mensaje a mostrar
  final String message;

  final Duration? duration;
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(message),
      backgroundColor: GStyles.colorPrimary,
      duration: duration ?? const Duration(seconds: 5),
    );
  }
}
