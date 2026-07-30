import 'package:flutter/material.dart';
import 'constants.dart';
import 'pages/home_page.dart';
import 'pages/reports_page.dart';
import 'pages/cards_page.dart';
import 'pages/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment 2 - Flutter APP UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'Roboto',
        useMaterial3: true,
        colorSchemeSeed: AppColors.accentPurple,
      ),
      home: const MainScreen(),
    );
  }
}

/// -----------------------------------------------------------------
/// MainScreen: hosts the bottom navigation bar and controls page
/// switching using PageView + PageController, as required by the
/// assignment.
/// -----------------------------------------------------------------
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _pages = const [
    HomePage(),
    ReportsPage(),
    CardsPage(),
    ProfilePage(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    setState(() => _currentIndex = index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onPageChanged(int index) {
    // Keeps the bottom nav bar in sync when the user swipes
    // between pages instead of tapping the nav bar.
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: _onPageChanged,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.accentPurple,
        unselectedItemColor: AppColors.textGrey,
        showUnselectedLabels: true,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        elevation: 8,
        items: [
          _navItem(Icons.home_outlined, Icons.home, "Home"),
          _navItem(Icons.bar_chart_outlined, Icons.bar_chart, "Reports"),
          _navItem(Icons.credit_card_outlined, Icons.credit_card, "Cards"),
          _navItem(Icons.person_outline, Icons.person, "Profile"),
        ],
      ),
    );
  }

  /// Builds a nav item whose *active* state shows a rounded purple
  /// highlight pill behind the icon, matching the Figma design.
  BottomNavigationBarItem _navItem(
      IconData outlineIcon, IconData filledIcon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(outlineIcon),
      activeIcon: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.accentPurple.withOpacity(0.12),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(filledIcon, color: AppColors.accentPurple),
      ),
      label: label,
    );
  }
}
