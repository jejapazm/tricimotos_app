import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mototaxis_app/services/login_service.dart';
import 'package:mototaxis_app/ui/messages.dart';

import '../constants/palette.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _ingresable = true;
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette().white,
      body: Padding(
        padding: const EdgeInsets.only(right: 20.0, left: 20.0),
        child: Stack(
          children: [
            // SingleChildScrollView(),
            _fondo(),
            _formulario(),
          ],
        ),
      ),
    );
  }

  Widget _fondo() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 120.0, bottom: 20.0),
          child: Row(
            children: [
              Expanded(
                child: CircleAvatar(
                  backgroundColor: Palette().gris2,
                  radius: 50.0,
                  child: Icon(
                    Icons.widgets,
                    size: 60.0,
                    color: Palette().oscuro,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _formulario() {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            transform: Matrix4.translationValues(0.0, 30.0, 0.0),
            padding:
                EdgeInsets.only(top: 130.0 + size.height * 0.2, bottom: 10.0),
            child: Column(
              children: [
                const SizedBox(height: 30.0),
                _userInput(),
                const SizedBox(height: 12.0),
                _passwordInput(),
                const SizedBox(height: 12.0),
                _loginButton(context),
                const SizedBox(height: 30.0),
                _newAccount(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _userInput() {
    return TextField(
      style: const TextStyle(fontSize: 18),
      controller: _userController,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        hintText: 'Ingrese su Usuario',
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black45)),
        border:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black45)),
        fillColor: Colors.grey,
        filled: true,
      ),
    );
  }

  Widget _passwordInput() {
    return TextField(
      style: const TextStyle(fontSize: 18),
      controller: _passwordController,
      obscureText: true,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        hintText: 'Ingrese su Contraseña',
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black45)),
        border:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black45)),
        fillColor: Colors.grey,
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
                  print('LOGIN PRESIONADO');
                    setState(() => _ingresable = false);
                    if (await Connectivity().checkConnectivity() ==
                        ConnectivityResult.none) {
                      if (context.mounted) {
                        _ingresable = await getSnackbar(context, 'Sin Internet',
                            Palette().bad, Icons.signal_wifi_off);
                      }
                    } else {
                      Response result = await login(
                          _userController.text, _passwordController.text);
                      if (context.mounted) {}
                      if (result.ok) {
                        getSnackbar(context, result.message, Palette().ok,
                            Icons.password);
                        Navigator.pushReplacementNamed(context, 'loading');
                      } else {
                        _ingresable = await getSnackbar(context, result.message,
                            Palette().bad, Icons.password);
                      }
                      // // Navigator.pushReplacementNamed(context, 'chekpoint_home');
                    }
                    setState(() => _ingresable = true);
                  }
                : () {
                  print('LOGIN PRESIONADO 2');
                },
            style: TextButton.styleFrom(
              backgroundColor: Palette().button1,
              textStyle: const TextStyle(fontSize: 18.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Iniciar Sesión',
                style: TextStyle(color: Palette().white),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _newAccount(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () => {},
            child: Text(
              'Crear cuenta nueva',
              style: TextStyle(
                  color: Palette().button1,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }
}
