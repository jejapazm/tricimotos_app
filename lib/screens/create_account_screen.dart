import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mototaxis_app/global/shared_preferences.dart';
import 'package:mototaxis_app/services/create_account_service.dart';
import 'package:mototaxis_app/ui/messages.dart';

import '../constants/palette.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool _ingresable = true;
  final _passwordController = TextEditingController();
  final _passwordRepeatController = TextEditingController();
  final _namesController = TextEditingController();
  final _surnamesController = TextEditingController();
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
                    children: [
                      const SizedBox(height: 80.0),
                      _title(),
                      const SizedBox(height: 30.0),
                      _subtitle(
                          'Con tu nombre podemos hacer seguimiento en caso de que necesites ayuda'),
                      const SizedBox(height: 10.0),
                      _nameInput(),
                      const SizedBox(height: 12.0),
                      _surnameInput(),
                      const SizedBox(height: 12.0),
                      _subtitle(
                          'Tu correo se usará como usuario para que ingreses a nuestra app'),
                      const SizedBox(height: 10.0),
                      _userInput(),
                      const SizedBox(height: 12.0),
                      _subtitle(
                          'Crea una contraseña fuerte, que incluya números, mayúsculas y minúsculas'),
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
    return const Center(
        child: Text(
      'Para crear una nueva cuenta necesitamos los siguientes datos:',
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
    ));
  }

  Widget _subtitle(String subtitle) {
    return Center(
        child: Text(
      subtitle,
      style: const TextStyle(fontSize: 17),
    ));
  }

  Widget _formulario() {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              height: size.height,
              transform: Matrix4.translationValues(0.0, 30.0, 0.0),
              padding:
                  EdgeInsets.only(top: 130.0 + size.height * 0.2, bottom: 10.0),
              child: Column(
                children: [
                  const SizedBox(height: 30.0),
                  _nameInput(),
                  const SizedBox(height: 12.0),
                  _surnameInput(),
                  const SizedBox(height: 12.0),
                  _userInput(),
                  const SizedBox(height: 12.0),
                  _passwordInput(),
                  const SizedBox(height: 12.0),
                  _passwordRepeatInput(),
                  const SizedBox(height: 32.0),
                  _loginButton(context),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _nameInput() {
    return TextField(
      style: const TextStyle(fontSize: 17),
      controller: _namesController,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
        hintText: 'Ingrese nombre',
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
    return TextField(
      style: const TextStyle(fontSize: 17),
      controller: _surnamesController,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
        hintText: 'Ingrese su apellido',
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
    return TextField(
      style: const TextStyle(fontSize: 17),
      controller: _usernameController,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
        hintText: 'Ingrese su correo',
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
    return TextField(
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
    return TextField(
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
                        rol: 'passenger',
                        contactNumber: '1234567890',
                        identification: '1234578456',                        
                      );
                      if (context.mounted) {}
                      if (result.ok) {
                        getSnackbar(context, result.message, Palette().ok,
                            Icons.password);
                        if (Prefs.rol == 'superAdmin') {
                          Navigator.pushReplacementNamed(context, 'admin_home');
                        } else {
                          Navigator.pushReplacementNamed(context, 'loading');
                        }
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
                'Crear Cuenta',
                style: TextStyle(color: Palette().white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
