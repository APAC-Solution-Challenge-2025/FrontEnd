import 'package:flutter/material.dart';
import '../routes.dart';
import 'provider/calendar_data.dart';
import 'package:provider/provider.dart';
import 'widgets/layout.dart';
import 'screens/main_tabs/login/login_body_change_info.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CalendarData(),
      child: const MyApp(),
    ),
  );
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
      home: BodyInfoScreen(),
      // home: const Layout(),
      // routes: AppRoutes.routes, // routes.dart 파일에서 설정한 경로를 가져오기
=======
      home: const Layout(), // 초기 화면 설정
      routes: AppRoutes.routes, // routes.dart 파일에서 설정한 경로를 가져오기
>>>>>>> develop
    );
  }
}
