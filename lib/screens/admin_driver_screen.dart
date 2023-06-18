import 'package:flutter/material.dart';
import 'package:mototaxis_app/constants/palette.dart';
import 'package:mototaxis_app/services/users_service.dart';

import '../models/user_model.dart';

class DriverScreen extends StatefulWidget {
  const DriverScreen({super.key});

  @override
  State<DriverScreen> createState() => _DriverScreenState();
}

class _DriverScreenState extends State<DriverScreen> {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as List<String>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mototaxista'),
        backgroundColor: Palette().cUCLABlue,
      ),
      body: FutureBuilder<User>(
        future: getUsersById(id: arguments[0]),
        initialData: null,
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          final user = snapshot.data;
          if (user != null) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                color: Palette().cAliceBlue,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Row(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nombres"),
                          Text("Apellidos"),
                          Text("Usuario"),
                          Text("Identificación"),
                          Text("Número de contacto"),
                        ],
                      ),
                      const Spacer(flex: 3),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(user.names,
                              style: const TextStyle(fontWeight: FontWeight.bold)),
                          Text(user.surnames,
                              style: const TextStyle(fontWeight: FontWeight.bold)),
                          Text(user.username,
                              style: const TextStyle(fontWeight: FontWeight.bold)),
                          Text(user.identification,
                              style: const TextStyle(fontWeight: FontWeight.bold)),
                          Text(user.contactNumber,
                              style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                      ),
              ),
            ],
          );
            
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
