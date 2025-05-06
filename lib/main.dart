import 'package:flutter/material.dart';
import '../routes.dart';
import 'provider/calendar_data.dart';
import 'package:provider/provider.dart';
<<<<<<< HEAD
import 'widgets/layout.dart';
import 'screens/main_tabs/login/login_user_select_page.dart';
=======
import 'screens/home/splash_screen.dart';
>>>>>>> develop

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
      home: const LoginUserSelect(),
      // home: const Layout(), // 초기 화면 설정
      // routes: AppRoutes.routes, // routes.dart 파일에서 설정한 경로를 가져오기
=======
      home: const SplashScreen(), // 초기 화면 설정
      routes: AppRoutes.routes, // routes.dart 파일에서 설정한 경로를 가져오기
>>>>>>> develop
    );
  }
}
