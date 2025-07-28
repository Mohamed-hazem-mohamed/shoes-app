import 'package:flutter/material.dart';
import 'package:project/splash_screen/splashscreen.dart';
import 'package:project/welcome_screen/mainwelcomescreen.dart';

import 'bottom_nav_bar/bottom_nav_bar.dart';
import 'diohelper/diohelper.dart';
import 'home/home.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => SplashScreen(),
        'welcomescreen' : (context) => Mainwelcomescreen(),
       // '/home' : (context) => Home(),
        '/navbar' : (context) => BottomNavBar(),

      },
    );
  }
}
