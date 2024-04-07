// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:total_x_test/view/loginpage/loginscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBRmqXUSUMcqpVgiW08FbP17iYTuF3i6Sc",
          appId: "1:365317921352:android:de325b891023f4d692167d",
          messagingSenderId: "",
          projectId: "firebasadatabaeapp",
          storageBucket: "firebasadatabaeapp.appspot.com"));
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
