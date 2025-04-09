import 'screens/home/home.dart';
import 'screens/main_tabs/page1.dart';
import 'screens/main_tabs/page2.dart';
import 'screens/main_tabs/login/login_screen.dart';
import 'screens/main_tabs/login/login_choose_hobby.dart';
import 'screens/main_tabs/login/login_health_check.dart';

class AppRoutes {
  static final routes = {
    '/': (context) => const LoginHealthCheck(), // Home 화면 경로
    '/page1': (context) => const Page1(), // 첫 번째 페이지
    '/page2': (context) => const Page2(), // 두 번째 페이지
  };
}
