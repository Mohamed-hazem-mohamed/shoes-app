import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:project/welcome_screen/pagedecocation.dart';

import '../home/home.dart';
import '../login_signup/login.dart';
import '../login_signup/siginin.dart';
import '../login_signup/signup.dart';

class Mainwelcomescreen extends StatelessWidget {
  const Mainwelcomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          titleWidget: const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Start Journy",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 40
                  ),
                  ),
                  Text(
                    "With Nike",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 40
                    ),
                  ),
                ],
              ),
            )
          ),
          bodyWidget: const Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Smart,Gorgeous & Fashionable",
                  style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 20
                  ),
                ),
                Text(
                  "Collection",
                  style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 20
                  ),
                ),
              ],
            ),
          ),
          image: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "Assets/shoose.png",
                  height: 250,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  "Assets/backgroundwelcome.png",
                  height: 250,
                ),
              ],
            ),
          ),
          decoration: getPageDecoration(),
        ),

        PageViewModel(
          titleWidget: const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Follow Latest",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 40
                    ),
                  ),
                  Text(
                    "Style shose",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 40
                    ),
                  ),
                ],
              ),
            )
          ),
          bodyWidget: const Align(
            alignment: Alignment.centerLeft,
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "There Are Many Beautiful And",
                  style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 20
                  ),
                ),
                Text(
                  "Attractive Plants To your Room ",
                  style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 20
                  ),
                ),
              ],
            ),
          ),
          image: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "Assets/shoose2.png",
                  height: 250,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  "Assets/backgroundwelcome.png",
                  height: 250,
                ),
              ],
            ),
          ),
          decoration: getPageDecoration(),
        ),PageViewModel(
          titleWidget: const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Summer Shose",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 40
                    ),
                  ),
                  Text(
                    "Nike 2025",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 40
                    ),
                  ),
                ],
              ),
            )
          ),
          bodyWidget: const Align(
            alignment: Alignment.centerLeft,
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Amet Minim Lit Node seru",
                  style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 20
                  ),
                ),
                Text(
                  "Nandu sit Alique Dolor",
                  style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 20
                  ),
                ),
              ],
            ),
          ),
          image: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "Assets/shoose3.png",
                  height: 250,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  "Assets/backgroundwelcome.png",
                  height: 250,
                ),
              ],
            ),
          ),
          decoration: getPageDecoration(),
        ),
      ],
      onDone: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>  LoginScreen()),
        );
      },
      done:  Container(
        width: 165,
        height: 54,
        decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(50)
        ),
        child:Center(
          child: Text(
            "Go to Login",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      next: Container(
        width: 165,
          height: 54,
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(50)
          ),
          child:Center(
              child: Text(
                "Next",
                style: TextStyle(
                    color: Colors.white
                ),
              )
          ),
      ),
      showSkipButton: true,
      skip: const Text("skip"),
      dotsDecorator: getDotDecoration(),
    );
  }
}
