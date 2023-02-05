import 'package:esports_cuba/src/shared/extensions.dart';
import 'package:flutter/material.dart';

import '../../../resources/general_styles.dart';

class GenericSnackBar extends StatelessWidget {
  const GenericSnackBar({
    super.key,
    required this.text,
    this.duration,
  });

  ///Texto a mostrar en el snackBar
  final String text;

  ///Duración de la animación
  final Duration? duration;

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(text),
      backgroundColor: GStyles.colorPrimary,
      duration: duration ?? const Duration(seconds: 5),
    );
  }
}
