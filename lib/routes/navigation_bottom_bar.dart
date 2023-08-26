import 'package:flutter/material.dart';
import 'package:light_digital_test_app/routes/pages.dart';

class NavigationBottomBar extends StatefulWidget {
  const NavigationBottomBar({super.key});

  @override
  State<NavigationBottomBar> createState() => _NavigationBottomBarState();
}

class _NavigationBottomBarState extends State<NavigationBottomBar> {
  int _selectedIdx = 0;
  static final _pages = <Widget>[
    const HomePage(),
    const EventsPage(),
    const ChatPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(index) {
    setState(() {
      _selectedIdx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIdx),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 24,
        elevation: 0,
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: "главная",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today_outlined,
            ),
            label: "мероприятия",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_bubble_outline_sharp,
            ),
            label: "чат",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
            ),
            label: "мой профиль",
          ),
        ],
        currentIndex: _selectedIdx,
        onTap: _onItemTapped,
      ),
    );
  }
}
