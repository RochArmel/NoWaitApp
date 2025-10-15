import 'package:flutter/material.dart';
import 'package:app/screens/welcome_screen.dart';

void main() {
  runApp(const NoWaitApp());
}

class NoWaitApp extends StatelessWidget {
  const NoWaitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NO WAIT',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const WelcomeScreen(),
    );
  }
}