import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

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
        scaffoldBackgroundColor: Colors.white,

        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF205E50),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF205E50),
            foregroundColor: Colors.white,
            minimumSize: Size(0, 48),
          ),
        ),
      ),

      home: const LoginScreen(),
    );
  }
}