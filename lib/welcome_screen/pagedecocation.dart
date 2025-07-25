import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

PageDecoration getPageDecoration() => const PageDecoration(
  bodyAlignment: Alignment.topLeft,
  contentMargin: EdgeInsets.only(left: 0, right: 16, top: 16, bottom: 16),
  imagePadding: EdgeInsets.only(top: 40),
  pageColor: Colors.white,
);

DotsDecorator getDotDecoration() => DotsDecorator(
  size: const Size(10, 25),
  color: Colors.grey,
  activeSize: const Size(22, 10),
  activeColor: Colors.deepPurple,
  activeShape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(24.0),
  ),
);
