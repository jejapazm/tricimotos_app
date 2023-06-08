import 'package:flutter/material.dart';
import 'package:mototaxis_app/constants/palette.dart';
import 'package:mototaxis_app/ui/drawer_tile.dart';

import '../global/shared_preferences.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Palette().bg1,
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(13),
            color: Palette().bg2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: CircleAvatar(
                    backgroundColor: Palette().cCinereous,
                    radius: 30.0,
                    child: Icon(Icons.account_circle,
                        size: 60.0, color: Palette().bg2),
                  ),
                ),
                Text(
                  Prefs.name,
                  style: TextStyle(fontSize: 17, color: Palette().text1),
                ),
                Text(
                  Prefs.rol,
                  style: TextStyle(color: Palette().text1),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Column(
              children: [
                DrawerTile(
                  leading: Icon(Icons.info, size: 20, color: Palette().icons3),
                  onTap: () => Navigator.pushReplacementNamed(
                      context, "terms_and_conditions"),
                  title: "Términos y Condiciones",
                  trailing: Icon(Icons.arrow_forward_ios, color: Palette().text2),
                ),
                DrawerTile(
                  leading: Icon(Icons.directions_run, size: 20, color: Palette().icons3),
                  onTap: () => Navigator.pushReplacementNamed(
                      context, "terms_and_conditions"),
                  title: "Manual de Usuario",
                  trailing: Icon(Icons.arrow_forward_ios, color: Palette().text2),
                ),
                DrawerTile(
                  leading: Icon(Icons.exit_to_app, size: 20, color: Palette().bad),
                  onTap: () => Navigator.pushReplacementNamed(context, "login"),
                  title: "Cerrar Sesión",
                  trailing: Icon(Icons.arrow_forward_ios, color: Palette().text2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
