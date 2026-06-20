import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../data/repositories/profile_repository.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState();
}

class _SplashScreenState
    extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration:
          const Duration(milliseconds: 900),
    );

    fadeAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
    );

    controller.forward();

    _bootstrap();
  }

  Future<void> _bootstrap() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    final profile =
        await ProfileRepository()
            .getProfile();

    if (!mounted) return;

    if (profile == null) {
      context.go('/onboarding');
      return;
    }

    context.go('/home');
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFF1B5E20),
      body: Center(
        child: FadeTransition(
          opacity: fadeAnimation,
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/app_logo.png',
                width: 120,
                height: 120,
              ),

              const SizedBox(height: 24),

              const Text(
                'Fasal AI',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Crop Disease Detector',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}