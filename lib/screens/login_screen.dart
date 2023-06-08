import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mototaxis_app/global/shared_preferences.dart';
import 'package:mototaxis_app/services/login_service.dart' as login_service;
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
      backgroundColor: Palette().cAliceBlue,
      body: Stack(
        children: [
          _fondo(),
          _formulario(),
        ],
      ),
    );
  }

  Widget _fondo() {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        const SizedBox(height: 80),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'assets/logo-tricimotos.png',
                  height: size.width * 0.4,
                  width: size.width * 0.4,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ],
    );
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
                  _userInput(),
                  const SizedBox(height: 12.0),
                  _passwordInput(),
                  const SizedBox(height: 32.0),
                  _loginButton(context),
                  const SizedBox(height: 30.0),
                  _newAccount(context),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _userInput() {
    return TextField(
      style: const TextStyle(fontSize: 17),
      controller: _userController,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
        hintText: 'Ingrese su Usuario',
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
        hintText: 'Ingrese su Contraseña',
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
                      final result = await login_service.login(
                          _userController.text, _passwordController.text);
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
            onPressed: () => Navigator.pushNamed(context, 'create_account'),
            child: Text(
              'Crear cuenta nueva',
              style: TextStyle(
                  color: Palette().cCinereous,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }
}
