import 'package:flutter/material.dart';
import '../routes.dart';
import 'provider/calendar_data.dart';
import 'provider/notification_provider.dart';
import 'package:provider/provider.dart';
import 'screens/home/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => CalendarData()),
            ChangeNotifierProvider(create: (_) => NotificationProvider()),
          ],
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
      home: const SplashScreen(), // 초기 화면 설정
      routes: AppRoutes.routes, // routes.dart 파일에서 설정한 경로를 가져오기
    );
  }
}
