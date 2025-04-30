import 'package:flutter/material.dart';
import 'routes.dart';
import 'widgets/layout.dart';
import 'screens/main_tabs/login/login_body_change_info.dart';

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
      home: BodyInfoScreen(),
      // home: const Layout(),
      // routes: AppRoutes.routes, // routes.dart 파일에서 설정한 경로를 가져오기
    );
  }
}
