import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../posts/posts_page.dart';
import '../users/users_page.dart';
import '../counter/counter_page.dart';
import '../theme_demo/theme_demo_page.dart';

/// Main navigation page with bottom tab bar
/// Follows Clean Architecture - Presentation Layer
class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> 
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _animationController;

  // List of pages for each tab
  final List<Widget> _pages = const [
    PostsPage(),
    UsersPage(),
    CounterPage(),
    ThemeDemoPage(),
  ];

  // Tab configuration
  final List<_TabConfig> _tabConfigs = const [
    _TabConfig(
      icon: Icons.article_outlined,
      activeIcon: Icons.article,
      label: 'Posts',
      color: Colors.blue,
    ),
    _TabConfig(
      icon: Icons.people_outline,
      activeIcon: Icons.people,
      label: 'Users',
      color: Colors.green,
    ),
    _TabConfig(
      icon: Icons.add_circle_outline,
      activeIcon: Icons.add_circle,
      label: 'Counter',
      color: Colors.orange,
    ),
    _TabConfig(
      icon: Icons.palette_outlined,
      activeIcon: Icons.palette,
      label: 'Theme',
      color: Colors.purple,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
        child: IndexedStack(
          key: ValueKey<int>(_currentIndex),
          index: _currentIndex,
          children: _pages,
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          selectedItemColor: _tabConfigs[_currentIndex].color,
          unselectedItemColor: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
          backgroundColor: Theme.of(context).colorScheme.surface,
          elevation: 0,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          items: _tabConfigs.asMap().entries.map((entry) {
            final index = entry.key;
            final config = entry.value;
            final isSelected = index == _currentIndex;
            
            return BottomNavigationBarItem(
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  isSelected ? config.activeIcon : config.icon,
                  key: ValueKey<bool>(isSelected),
                  color: isSelected ? config.color : null,
                ),
              ),
              label: config.label,
            );
          }).toList(),
        ),
      ),
    );
  }

  void _onTabTapped(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });
      
      // Trigger animation for smooth transition
      _animationController.reset();
      _animationController.forward();
      
      // Haptic feedback
      HapticFeedback.lightImpact();
    }
  }
}

/// Configuration class for tab items
class _TabConfig {
  const _TabConfig({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final IconData activeIcon;
  final String label;
  final Color color;
} 