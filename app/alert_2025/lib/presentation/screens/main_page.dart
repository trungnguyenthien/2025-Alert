import 'package:flutter/material.dart';
import 'home_page.dart';
import 'search_page.dart';
import 'favorite_page.dart';
import 'profile_page.dart';
import '../../core/base_page.dart';
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  // List of pages
  final List<Widget> _pages = [
    const HomePage(),
    const SearchPage(),
    const FavoritePage(),
    const ProfilePage(),
  ];

  /// 🔄 Change tab when user taps on bottom navigation
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = _pages[_selectedIndex] as BasePage; // Cast sang BasePage để lấy AppBar

    return Scaffold(
      appBar: currentPage.appBar, // Lấy AppBar từ từng page con
      body: currentPage, // Hiển thị page hiện tại
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black87,
        selectedItemColor: Colors.orangeAccent, // Màu của tab được chọn
        unselectedItemColor: Colors.white, // Màu của tab không được chọn
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
