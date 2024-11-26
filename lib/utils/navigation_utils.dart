import 'package:flutter/material.dart';
import '../pages/home_screen.dart';
import '../pages/booking_page.dart';
import '../pages/drive_page.dart';
import '../pages/park_page.dart';
import '../pages/charge_page.dart';

class MainNavigationScreen extends StatefulWidget {
  final int initialIndex;
  final String? userEmail;

  const MainNavigationScreen({
    super.key,
    this.initialIndex = 4,
    this.userEmail,
  });

  @override
  _MainNavigationScreenState createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  late int _currentIndex;

  // List of screens in the same order as bottom navigation
  final List<Widget> _screens = [
    const ChargeScreen(),
    const DriveScreen(),
    const ParkScreen(),
    const BookingsScreen(),
    HomePage(userEmail: null), // Placeholder, will be replaced in initState
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;

    // Replace the last screen with HomePage with user email
    _screens[4] = HomePage(userEmail: widget.userEmail);
  }

  void _onBottomNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onBottomNavTap,
        selectedItemColor: const Color(0xFFEFC94C),
        unselectedItemColor: Colors.grey,
        type:
            BottomNavigationBarType.fixed, // This ensures all items are visible
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.compare_arrows),
            label: 'Charge',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.drive_eta),
            label: 'Drive',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_parking),
            label: 'Park',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
