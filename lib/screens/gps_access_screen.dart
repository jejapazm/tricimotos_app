import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/gps/gps_bloc.dart';

class GpsAccessScreen extends StatelessWidget {
  const GpsAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: BlocBuilder<GpsBloc, GpsState>(
        builder: (context, state) {
          return !state.isGpsEnable ? 
          const _EnableGpsMessage() : 
          const _AccessButton();
        },
      ) 
      // _AccessButton()
      ),
    );
  }
}

class _AccessButton extends StatelessWidget {
  const _AccessButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Es necesario el acceso GPS'),
        MaterialButton(
            color: Colors.black,
            shape: const StadiumBorder(),
            elevation: 0,
            splashColor: Colors.transparent,
            onPressed: () {
              

              final gpsBloc = BlocProvider.of<GpsBloc>(context);

              gpsBloc.askGpsAccess();


            },
            child: const Text(
              'solicitar acceso',
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}

class _EnableGpsMessage extends StatelessWidget {
  const _EnableGpsMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Debe de habilitar el gps',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
    );
  }
}
