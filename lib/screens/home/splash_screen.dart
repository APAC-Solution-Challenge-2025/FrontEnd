import 'package:flutter/material.dart';
import 'dart:async';
import '../../widgets/layout.dart';
import '../main_tabs/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // 2초 후에 Layout() 화면으로 이동
    Timer(const Duration(seconds: 2), () {
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => const Layout()),
      // );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      ); //이건 로그인화면부터 보이게 하는 거!!
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xffE5CEBC),
      body: Center(
        child: Image.asset('assets/images/in_grass.png',
            width: screenWidth * 0.65),
      ),
    );
  }
}
