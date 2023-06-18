import 'package:flutter/material.dart';
import 'package:mototaxis_app/constants/palette.dart';
import 'package:mototaxis_app/models/user_model.dart';
import 'package:mototaxis_app/services/users_service.dart';

class DriversListScreen extends StatefulWidget {
  const DriversListScreen({super.key});

  @override
  State<DriversListScreen> createState() => _DriversListScreenState();
}

class _DriversListScreenState extends State<DriversListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette().cUCLABlue,
        title: const Text('Lista de mototaxistas'),
      ),
      body: FutureBuilder<List<User>>(
        future: getUsersByRol(rol: "driver"),
        builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
          print(snapshot);
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No hay datos'),
            );
          } else {
            List<User> usersList = snapshot.data!;
            return ListView.builder(
              itemCount: usersList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Palette().cAliceBlue,
                  child: ListTile(
                    title: Text(
                        '${usersList[index].names} ${usersList[index].surnames}'),
                    subtitle: Text(usersList[index].identification),
                    leading: const Icon(Icons.person, size: 30),
                    trailing: const Icon(Icons.arrow_right, size: 30),
                    onTap: () => Navigator.of(context)
                        .pushNamed('driver', arguments: [usersList[index].id]),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
