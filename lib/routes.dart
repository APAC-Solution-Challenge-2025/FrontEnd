import 'screens/home/home.dart';
import 'screens/main_tabs/report/report_main_page.dart';
import 'screens/main_tabs/report/report_detail_page.dart';

class AppRoutes {
  static final routes = {
    '/': (context) => const HomePage(), // Home 화면 경로
    '/reportMainPage': (context) => const ReportMainPage(),
    '/reportDetailPage': (context) => const ReportDetailPage(),
  };
}