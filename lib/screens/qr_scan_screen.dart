import 'package:flutter/material.dart';
import 'package:mototaxis_app/constants/palette.dart';
import 'package:mototaxis_app/ui/drawer.dart';

class QRCodeScanScreen extends StatefulWidget {
  const QRCodeScanScreen({super.key});

  @override
  State<QRCodeScanScreen> createState() => _QRCodeScanScreenState();
}

class _QRCodeScanScreenState extends State<QRCodeScanScreen> {

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const DrawerWidget(),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(21.0),
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: null,
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        backgroundColor: Palette().cRitchBlack,
                        textStyle: const TextStyle(fontSize: 18.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          'Empezar Nueva Carrera',
                          style: TextStyle(color: Palette().white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 30,
            child: CircleAvatar(
              backgroundColor: Palette().cCinereous,
              radius: 22,
              child: IconButton(
                onPressed: () => scaffoldKey.currentState?.openDrawer(),
                icon:
                    const Icon(Icons.menu, color: Colors.white, size: 20),
              ),
            ),
          ),
        ],
      )
    );
  }
}