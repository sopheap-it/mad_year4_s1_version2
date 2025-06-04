import 'package:flutter/material.dart';
import 'package:mad_year4_s1_version2/screens/favorite_screen.dart';
import 'package:mad_year4_s1_version2/screens/home_screen.dart';
import 'package:mad_year4_s1_version2/screens/about_screen.dart';
import 'package:mad_year4_s1_version2/screens/notification_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  static const List<Widget> _screenList = [
    HomeScreen(),
    FavoriteScreen(),
    NotificationScreen(),
    AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // Prevent going back to login screen
      child: Scaffold(
        body: _body,
        bottomNavigationBar: _bottomNav,
      ),
    );
  }

  Widget get _body {
    return IndexedStack(
      index: _currentIndex,
      children: _screenList,
    );
  }

  Widget get _bottomNav {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF667eea),
        unselectedItemColor: Colors.grey[600],
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            activeIcon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_rounded),
            activeIcon: Icon(Icons.favorite_rounded),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            activeIcon: Icon(Icons.notifications_rounded),
            label: "Notification",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            activeIcon: Icon(Icons.person_rounded),
            label: "About",
          ),
        ],
      ),
    );
  }

  void _onTabTapped(int index) {
    if (_currentIndex != index) {
      setState(() {
        _currentIndex = index;
      });
    }
  }
}
