import 'package:flutter/material.dart';
import 'screens/home/home.dart';
import 'screens/main_tabs/page1.dart'; // test용으로 임의로 넣었음
import 'screens/main_tabs/page2.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    '/home': (context) => const HomePage(),
    '/calendar': (context) => const Page1(),
    '/chat': (context) => const Page2(),
  };
}