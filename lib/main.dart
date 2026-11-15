import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const FreshCutApp());
}

class FreshCutApp extends StatelessWidget {
  const FreshCutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FreshCut',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomeScreen(),
    );
  }
}