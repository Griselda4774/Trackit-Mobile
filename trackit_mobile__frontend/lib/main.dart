import 'package:flutter/material.dart';
import 'package:trackit_mobile__frontend/Presentation/UI/Screens/CartPage.dart';
import 'package:trackit_mobile__frontend/Presentation/UI/Screens/HomePage.dart';
import 'package:trackit_mobile__frontend/Presentation/UI/Screens/LoginPage.dart';
import 'package:trackit_mobile__frontend/Presentation/UI/Screens/MainPage.dart';
import 'package:trackit_mobile__frontend/Presentation/UI/Screens/Profile.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        '/loginpage': (context) => LoginPage(),
        '/homepage': (context) => HomePage(),
        '/mainpage': (context) => MainPage(),
        '/cartpage': (context) => CartPage(),
        '/profilepage': (context) => ProfilePage(),
      },
    );
  }
}
