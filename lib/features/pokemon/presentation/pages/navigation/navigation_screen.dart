import 'package:flutter/material.dart';
import '../favorites/favorites_screen.dart';
import '../home/home_screen.dart';

import 'widgets/custom_menu_item.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  static const String routeName = '/';

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  void _navigate(BuildContext context, int index) {
    _selectedPageIndex = index;
    setState(() {});
  }

  final List<Widget> _pages = const [
    HomeScreen(),
    FavoritesScreen(),
  ];

  final List<CustomMenuItem> _menuItems = const <CustomMenuItem>[
    CustomMenuItem(Icons.home_outlined, Icons.home, 'Home'),
    CustomMenuItem(Icons.favorite_outline, Icons.favorite, 'Favorite'),
  ];

  final List<Widget> _appBarTitles = const [
    Text('Home'),
    Text('Favorites'),
  ];

  int _selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _appBarTitles[_selectedPageIndex],
      ),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        elevation: 16,
        currentIndex: _selectedPageIndex,
        selectedItemColor: Colors.black,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        onTap: (index) => _navigate(context, index),
        items: _menuItems
            .map(
              (item) => BottomNavigationBarItem(
                activeIcon: Icon(item.active),
                backgroundColor: Colors.white,
                icon: Icon(item.icon),
                label: item.label,
              ),
            )
            .toList(),
      ),
    );
  }
}
