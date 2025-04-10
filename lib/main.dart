import 'package:flutter/material.dart';
import 'routes.dart';
import 'widgets/layout.dart';

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
      initialRoute: '/home', // 이후 아래 코드로 대체 예정 우선 개발 중인 화면 띄우기 위함
      // home: const Layout(), // 초기 화면 설정
      routes: AppRoutes.routes, // routes.dart 파일에서 설정한 경로를 가져오기
    );
  }
}
