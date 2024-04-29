import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Set the login page as the initial route
      initialRoute: '/splash', // Set the initial route to the splash screen
      debugShowCheckedModeBanner: false, // Add this line to remove the debug banner
      routes: {
        '/splash': (context) => const SplashScreen(), // Add the route for the splash screen
        '/login': (context) => const SignupPage(),
        '/dashboard': (context) => dashboardPage(), // Add the route for the dashboard page
      },
    );
  }
  
  dashboardPage() {}
}

// Splash Screen Widget
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      // Navigate to the login page after 3 seconds
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Display a loading indicator for the splash screen
      ),
    );
  }
}
