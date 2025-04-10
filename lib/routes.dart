import 'package:flutter/material.dart';
import 'screens/home/home.dart';
import 'screens/main_tabs/page1.dart'; // test용으로 임의로 넣었음
import 'screens/main_tabs/page2.dart';
import 'screens/main_tabs/login/login_choose_date.dart';
import 'screens/main_tabs/login/login_choose_hobby.dart';
import 'screens/main_tabs/login/login_health_check.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    '/home': (context) => const LoginChooseDate(),
    // '/home': (context) => const HomePage(),
    // '/calendar': (context) => const Page1(),
    // '/chat': (context) => const Page2(),
  };
}
