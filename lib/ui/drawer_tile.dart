import 'package:flutter/material.dart';
import 'package:mototaxis_app/constants/palette.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final Widget trailing;
  final Function() onTap;
  final Widget leading;

  const DrawerTile(
      {super.key,
      required this.title,
      required this.trailing,
      required this.onTap,
      required this.leading});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Card(
          color: Palette().bg2,
          margin: const EdgeInsets.symmetric(vertical: 3),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: ListTile(
            minLeadingWidth: 0,
            trailing: trailing,
            title: Text(
              title,
              style: TextStyle(
                  letterSpacing: .3, fontSize: 15, color: Palette().text1),
            ),
            leading: leading,
          ),
        ),
      ),
    );
  }
}
