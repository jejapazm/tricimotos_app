import 'package:flutter/material.dart';
import 'package:mototaxis_app/constants/palette.dart';
import 'package:mototaxis_app/ui/drawer.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        backgroundColor: Palette().cUCLABlue,
        title: Text('Menú administrativo'),
      ),
      body: Center(
        child: Text('admin home'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person_add),
        backgroundColor: Palette().cRitchBlack,
        onPressed: null,
      ),
    );
  }
}
