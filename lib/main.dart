import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'routes.dart';
import 'widgets/layout.dart';
=======
import '../routes.dart';
>>>>>>> 686e9ef (RE : feat-6-OAuth-회원가입-로그인-화면-구현)

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
<<<<<<< HEAD
<<<<<<< HEAD
      home: const Layout(), // 초기 화면 설정
=======
      initialRoute: '/', // 초기 화면 설정
>>>>>>> 686e9ef (RE : feat-6-OAuth-회원가입-로그인-화면-구현)
=======
      initialRoute: '/home', // 이후 아래 코드로 대체 예정 우선 개발 중인 화면 띄우기 위함
      // home: const Layout(), // 초기 화면 설정
>>>>>>> 1955ce7 (Feat: 로그인-회원가입-출산일-출산예정일-선택-화면-구현)
      routes: AppRoutes.routes, // routes.dart 파일에서 설정한 경로를 가져오기
    );
  }
}
