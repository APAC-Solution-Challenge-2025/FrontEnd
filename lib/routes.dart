import 'screens/home/home.dart';
<<<<<<< HEAD
import 'screens/main_tabs/report/report_main_page.dart';
import 'screens/main_tabs/report/report_detail_page.dart';

class AppRoutes {
  static final routes = {
    '/': (context) => const HomePage(), // Home 화면 경로
    '/reportMainPage': (context) => const ReportMainPage(),
    '/reportDetailPage': (context) => const ReportDetailPage(),
=======
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
>>>>>>> 0c0f55effd66992f945c06c34c6f3bd1cfdb759a
  };
}
