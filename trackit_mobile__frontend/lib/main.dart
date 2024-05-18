import 'package:flutter/material.dart';
import 'package:trackit_mobile__frontend/Presentation/UI/Screens/HomePage.dart';
import 'package:trackit_mobile__frontend/Presentation/UI/Screens/LoginPage.dart';
import 'package:trackit_mobile__frontend/Presentation/UI/Screens/MainPage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
      routes: {
        '/loginpage':(context) => const LoginPage(),
        '/homepage':(context) => const HomePage(),
        '/mainpage':(context) => const MainPage()
      },
    );
  }
}
