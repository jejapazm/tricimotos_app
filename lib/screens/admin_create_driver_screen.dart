import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:mototaxis_app/constants/palette.dart';
import '../services/create_account_service.dart';
import '../ui/messages.dart';

class AdminCreateDriverScreen extends StatefulWidget {
  const AdminCreateDriverScreen({super.key});

  @override
  State<AdminCreateDriverScreen> createState() =>
      _AdminCreateDriverScreenState();
}

class _AdminCreateDriverScreenState extends State<AdminCreateDriverScreen> {
  bool _ingresable = true;
  final _contactController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordRepeatController = TextEditingController();
  final _namesController = TextEditingController();
  final _surnamesController = TextEditingController();
  final _idController = TextEditingController();
  final _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette().cAliceBlue,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 80.0),
                      _title(),
                      const SizedBox(height: 30.0),
                      _subtitle('Datos del conductor'),
                      const SizedBox(height: 10.0),
                      _nameInput(),
                      const SizedBox(height: 12.0),
                      _surnameInput(),
                      const SizedBox(height: 12.0),
                      _identificationInput(),
                      const SizedBox(height: 12.0),
                      _contactInput(),
                      const SizedBox(height: 12.0),
                      _subtitle(
                          'Correo que se usará el conductor para el ingreso a la app'),
                      const SizedBox(height: 10.0),
                      _userInput(),
                      const SizedBox(height: 10.0),
                      _subtitle(
                          'Crea una contraseña para el conductor, que incluya números, mayúsculas y minúsculas'),
                      const SizedBox(height: 10.0),
                      _passwordInput(),
                      const SizedBox(height: 12.0),
                      _passwordRepeatInput(),
                      const SizedBox(height: 32.0),
                      _loginButton(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 10,
            top: 30,
            child: CircleAvatar(
              backgroundColor: Palette().cRitchBlack,
              radius: 22,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back,
                    color: Palette().cAliceBlue, size: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return const Text(
      'Registra los siguientes campos para crear un mototaxista',
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
    );
  }

  Widget _subtitle(String subtitle) {
    return Text(
      subtitle,
      style: const TextStyle(fontSize: 17),
    );
  }

  Widget _nameInput() {
    return TextFormField(
      style: const TextStyle(fontSize: 17),
      controller: _namesController,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
        hintText: 'Ingrese nombres',
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette().cCinereous)),
        fillColor: Palette().cPearl,
        filled: true,
      ),
    );
  }

  Widget _contactInput() {
    return TextFormField(
      style: const TextStyle(fontSize: 17),
      controller: _contactController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
        hintText: 'Ingrese contacto',
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette().cCinereous)),
        fillColor: Palette().cPearl,
        filled: true,
      ),
    );
  }

  Widget _surnameInput() {
    return TextFormField(
      style: const TextStyle(fontSize: 17),
      controller: _surnamesController,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
        hintText: 'Ingrese apellidos',
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette().cCinereous)),
        fillColor: Palette().cPearl,
        filled: true,
      ),
    );
  }

  Widget _userInput() {
    return TextFormField(
      style: const TextStyle(fontSize: 17),
      controller: _usernameController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
        hintText: 'Ingrese correo',
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette().cCinereous)),
        fillColor: Palette().cPearl,
        filled: true,
      ),
    );
  }

  Widget _identificationInput() {
    return TextFormField(
      style: const TextStyle(fontSize: 17),
      controller: _idController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
        hintText: 'Ingrese la identificación',
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette().cCinereous)),
        fillColor: Palette().cPearl,
        filled: true,
      ),
    );
  }

  Widget _passwordInput() {
    return TextFormField(
      style: const TextStyle(fontSize: 17),
      controller: _passwordController,
      obscureText: true,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
        hintText: 'Crear contraseña',
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette().cCinereous)),
        fillColor: Palette().cPearl,
        filled: true,
      ),
    );
  }

  Widget _passwordRepeatInput() {
    return TextFormField(
      style: const TextStyle(fontSize: 17),
      controller: _passwordRepeatController,
      obscureText: true,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
        hintText: 'Repetir contraseña',
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette().cCinereous)),
        fillColor: Palette().cPearl,
        filled: true,
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: _ingresable
                ? () async {
                    setState(() => _ingresable = false);
                    if (await Connectivity().checkConnectivity() ==
                        ConnectivityResult.none) {
                      if (context.mounted) {
                        _ingresable = await getSnackbar(context, 'Sin Internet',
                            Palette().bad, Icons.signal_wifi_off);
                      }
                    } else {
                      final result = await createUser(
                          username: _usernameController.text,
                          password: _passwordController.text,
                          names: _namesController.text,
                          surnames: _surnamesController.text,
                          rol: 'driver',
                          contactNumber: _contactController.text,
                          identification: _idController.text);
                      if (result.ok) {
                        getSnackbar(context, result.message, Palette().ok,
                            Icons.password);
                        Navigator.pushReplacementNamed(context, 'admin_home');
                      } else {
                        _ingresable = await getSnackbar(context, result.message,
                            Palette().bad, Icons.password);
                      }
                    }
                    setState(() => _ingresable = true);
                  }
                : () {},
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              backgroundColor: Palette().cRitchBlack,
              textStyle: const TextStyle(fontSize: 18.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Crear Mototaxista',
                style: TextStyle(color: Palette().white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
