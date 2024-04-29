import 'dart:async' show Timer;
import 'package:flutter/material.dart';
import 'package:flutter_application_2/signup.dart';

// ignore: use_key_in_widget_constructors
class SplashScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // ignore: prefer_const_constructors
    Timer(Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        // ignore: prefer_const_constructors
        MaterialPageRoute(builder: (context) => SignupPage()), // Navigate to SignUpScreen after splash
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.brown, // Background color
        child: Center(
          child: Image.asset('assets/bb.png'), // Replace with your splash screen image asset
        ),
      ),
    );
  }
}
