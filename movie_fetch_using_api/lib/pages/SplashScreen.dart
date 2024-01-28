import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_quadb_tech/pages/HomePage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset(
        'assets/logo.png', // Update the path based on your project structure
        width: 150, // Adjust the width as needed
      ),
      nextScreen: HomePage(),
      splashTransition: SplashTransition.rotationTransition,
    );
  }
}
