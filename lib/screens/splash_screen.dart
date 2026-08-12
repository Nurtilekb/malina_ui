import 'dart:async';

import 'package:flutter/material.dart';
import 'package:malina_ui/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      if (!mounted) {
        return;
      }

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF72055),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(56),
          child: Center(
            child: Image.asset(
              'assets/icons/logo_malina.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
