import 'package:flutter/material.dart';
import 'navibar.dart';
import '../screens/home/home.dart';
import '../screens/main_tabs/report/report_main_page.dart';
import '../screens/main_tabs/page2.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    ReportMainPage(),
    Page2(),
  ];

  void _onTap(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: NaviBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}