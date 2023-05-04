import 'package:flutter/material.dart';

void main() => runApp(const MapsApp());

class MapsApp extends StatelessWidget {
  const MapsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MapsApp',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}