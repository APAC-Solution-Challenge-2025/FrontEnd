import 'screens/home/home.dart';
import 'screens/main_tabs/report/report_main_page.dart';
import 'screens/main_tabs/report/report_detail_page.dart';
import 'screens/main_tabs/login/login_screen.dart';
//import 'screens/main_tabs/login/login_choose_hobby.dart';
//import 'screens/main_tabs/login/login_health_check.dart';

class AppRoutes {
  static final routes = {
    '/': (context) => const HomePage(), // Home 화면 경로
    '/reportMainPage': (context) => const ReportMainPage(),
    '/reportDetailPage': (context) => const ReportDetailPage(),
    '/loginMainPage':(context)=> const LoginScreen(),
  };
}