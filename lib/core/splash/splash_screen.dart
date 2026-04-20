import 'package:flutter/material.dart';
import 'package:school_management/constant/app_images.dart';
import 'package:school_management/constant/key_string.dart';
import 'package:school_management/core/common/custom_navigation_bar/bottom_navigation_bar.dart';
import 'package:school_management/core/utils/shared_pref.dart';
import 'package:school_management/feature/authentication/login/login_screen.dart';
import 'package:school_management/feature/authentication/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), _checkLoginStatus);
  }

  void _checkLoginStatus() {
    bool isOnboard = SharedPref.getBoolValue(KeyString.onboardUser.name);
    bool isLoginUser = SharedPref.getBoolValue(KeyString.isLoginUser.name);

    if (!mounted) return;

    if (isLoginUser) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    } else if (isOnboard) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset(AppImages.logo, width: 200)],
        ),
      ),
    );
  }
}
