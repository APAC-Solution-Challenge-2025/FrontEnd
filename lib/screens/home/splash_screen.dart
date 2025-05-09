import 'package:flutter/material.dart';
import 'dart:async';
import '../../widgets/layout.dart';

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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Layout()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:const Color(0xffE5CEBC),
      body: Center(
        child: Image.asset('assets/images/in_grass.png',width:screenWidth*0.65),
      ),
    );
  }
}