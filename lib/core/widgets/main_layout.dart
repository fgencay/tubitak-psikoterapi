import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/chat/screens/chat_screen.dart';
import '../../features/profile/screens/profile_screen.dart';

/// Ana layout widget'ı - Alt navigasyon bar ile
class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 1; // Ana sayfa ile başla

  void _goToHome() {
    setState(() {
      _currentIndex = 1;
    });
  }

  List<Widget> get _screens => [
    ChatScreen(onBackToHome: _goToHome),
    HomeScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          // Ana içerik
          IndexedStack(index: _currentIndex, children: _screens),

          // Floating Navigation Bar
          if (_currentIndex != 0)
            Positioned(
              left: 24,
              right: 24,
              bottom: 24,
              child: SafeArea(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.6),
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildNavItem(
                          index: 0,
                          icon: Icons.chat_bubble_outline_rounded,
                          activeIcon: Icons.chat_bubble_rounded,
                        ),
                        _buildNavItem(
                          index: 1,
                          icon: Icons.home_rounded,
                          activeIcon: Icons.home_rounded,
                        ),
                        _buildNavItem(
                          index: 2,
                          icon: Icons.person_outline_rounded,
                          activeIcon: Icons.person_rounded,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required IconData activeIcon,
  }) {
    final isActive = _currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isActive ? AppColors.textPrimary : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Icon(
          isActive ? activeIcon : icon,
          color: isActive ? Colors.white : AppColors.textSecondary,
          size: 26,
        ),
      ),
    );
  }
}
