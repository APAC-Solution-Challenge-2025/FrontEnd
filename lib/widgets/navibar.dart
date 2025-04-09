import 'package:flutter/material.dart';

class NaviBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const NaviBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xffbec5a6),
      unselectedItemColor: Colors.grey[400],
      items: [
        _buildNavItem(icon: Icons.home, label: 'Home', index: 0),
        _buildNavItem(icon: Icons.calendar_today, label: 'Calendar', index: 1),
        _buildNavItem(icon: Icons.favorite_border, label: 'Chat', index: 2),
      ],
    );
  }

  BottomNavigationBarItem _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final isSelected = index == currentIndex;
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          Container(
            height: 2,
            color: isSelected ? const Color(0xffbec5a6) : Colors.grey[200],
          ),
          const SizedBox(height: 4),
          Icon(
            icon,
          ),
        ],
      ),
      label: label,
    );
  }
}
