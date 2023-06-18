import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mototaxis_app/blocs/blocs.dart';
import 'package:mototaxis_app/screens/screens.dart';

import 'global/shared_preferences.dart';
import 'screens/admin_driver_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GpsBloc()),
        BlocProvider(create: (context) => LocationBloc()),
        BlocProvider(create: (context) => MapBloc()),
      ],
      child: const MapsApp(),
    ),
  );
}

class MapsApp extends StatelessWidget {
  const MapsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MapsApp',
      // home: GpsAccessScreen(),
      initialRoute: 'qrscan',
      // initialRoute: 'loading',
      routes: {
        'login': (_) => const LoginScreen(),
        'loading': (_) => const LoadingScreen(),
        'admin_home': (_) => const AdminHomeScreen(),
        'create_account': (_) => const CreateAccountScreen(),
        'create_driver': (_) => const AdminCreateDriverScreen(),
        'drivers_list': (_) => const DriversListScreen(),
        'driver': (_) => const DriverScreen(),
        'qrscan':(_) => const QRCodeScanScreen(),
      },
    );
  }
}
