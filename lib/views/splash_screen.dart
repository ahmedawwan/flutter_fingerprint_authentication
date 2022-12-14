import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fingerprint_authentication/views/home_screen.dart';
import 'package:flutter_fingerprint_authentication/views/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  navigateToHome() {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    // ===============================================================================
    // Timer is used so that after 2 seconds the user is navigated to login screen
    // ===============================================================================
    Timer(
      //Duration of timer
      const Duration(seconds: 2),
      // function (what happens after the timer stops)
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => firebaseAuth.currentUser == null
                ? const LoginScreen()
                : const HomeScreen(),
          ),
        );
      },
    );
  }

  // ===========================================================================
  // Init State
  // ===========================================================================
  @override
  void initState() {
    navigateToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'logo',
              child: Image.asset(
                'images/touch_ID.png',
                width: MediaQuery.of(context).size.width * 0.5,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Fingerprint Authentication',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
