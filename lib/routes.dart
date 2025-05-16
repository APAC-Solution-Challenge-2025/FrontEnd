import 'package:flutter/material.dart';
import 'screens/home/home.dart';
import 'screens/home/settings.dart';
import 'screens/main_tabs/report/report_main_page.dart';
import 'screens/main_tabs/report/report_detail_page.dart';
import 'screens/main_tabs/chat_page.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    '/home': (context) => const HomePage(),
    '/settings': (context) => const SettingPage(),
    '/calendar': (context) => const ReportMainPage(),
    '/calendarDetail': (context) => ReportDetailPage(),
    '/chat': (context) => ChatPage(),
  };
}
