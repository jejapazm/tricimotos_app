import 'package:flutter/material.dart';
import 'package:mototaxis_app/constants/palette.dart';

getSnackbar(BuildContext context, String text, Color color, IconData icon) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(
          duration: const Duration(milliseconds: 1500),
          backgroundColor: color,
          content: Row(
            children: [
              Icon(icon, color: Palette().white),
              const SizedBox(width: 10),
              Flexible(
                fit: FlexFit.loose,
                child: Text(text),
              ),
            ],
          )))
      .closed
      .then((value) => true);
}