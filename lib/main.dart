// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:total_x_test/view/loginpage/loginscreen.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Loginscreen(),
    );
  }
}
