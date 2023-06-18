import 'package:flutter/material.dart';
import 'package:mototaxis_app/constants/palette.dart';
import 'package:mototaxis_app/ui/drawer.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        backgroundColor: Palette().cUCLABlue,
        title: const Text('Menú administrativo'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: Card(
              color: Palette().cPearl,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: const Text('Ver mototaxistas'),

                  subtitle: const Text('Listado de tus conductores agregados'),
                  leading: const Icon(Icons.person, size: 40),
                  onTap: () => Navigator.of(context).pushNamed('drivers_list'),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: Card(
              color: const Color.fromRGBO(190, 198, 218, 1.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: const Text('Alertas'),
                  subtitle: const Text('alertas que los usuarios han hecho'),
                  leading: const Icon(Icons.info, size: 40),
                  onTap: () => Navigator.of(context).pushNamed('create_account'),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person_add),
        backgroundColor: Palette().cRitchBlack,
        onPressed: () => Navigator.of(context).pushNamed('create_driver'),
      ),
    );
  }
}
