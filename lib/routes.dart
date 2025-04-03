import 'screens/home/home.dart';
import 'screens/main_tabs/page1.dart';
import 'screens/main_tabs/page2.dart';
import 'screens/main_tabs/login/login_screen.dart';

class AppRoutes {
  static final routes = {
    '/': (context) => const HomePage(), // Home 화면 경로
    '/page1': (context) => const Page1(), // 첫 번째 페이지
    '/page2': (context) => const Page2(), // 두 번째 페이지
    '/loginPage': (context) => const LoginScreen(), // 로그인 페이지
  };
}
