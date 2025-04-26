import 'package:flutter/material.dart';
import 'screens/home/home.dart';
import 'screens/main_tabs/report/report_main_page.dart';
import 'screens/main_tabs/page2.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    '/home': (context) => const HomePage(),
    '/calendar': (context) => const ReportMainPage(),
    '/chat': (context) => const Page2(),
  };
}