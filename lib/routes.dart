import 'package:flutter/material.dart';
import 'screens/home/home.dart';
import 'screens/home/settings.dart';
import 'screens/main_tabs/report/report_main_page.dart';
import 'screens/main_tabs/report/report_detail_page.dart';
import 'screens/main_tabs/page2.dart';
import 'screens/main_tabs/login/login_user_select_page.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
<<<<<<< HEAD
    // '/home': (context) => const HomePage(),
    '/home': (context) => const LoginUserSelect(),
=======
    '/home': (context) => const HomePage(),
    '/settings' : (context) => const SettingPage(),
>>>>>>> develop
    '/calendar': (context) => const ReportMainPage(),
    '/calendarDetail': (context) => const ReportDetailPage(),
    '/chat': (context) => const Page2(),
  };
}
