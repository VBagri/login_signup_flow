import 'package:flutter/material.dart';
import 'pages/splash.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dream Job App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        // fontFamily: 'Poppins',
      ),
      home: const SplashScreen(),
    );
  }
}
