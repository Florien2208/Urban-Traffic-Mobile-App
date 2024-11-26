import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
// import '../screens/main_navigation_screen.dart';

class HomePage extends StatefulWidget {
  final String? userEmail;

  const HomePage({super.key, this.userEmail});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _handleLogout() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (Route<dynamic> route) => false,
    );
  }

  void _navigateToScreen(VoidCallback navigationAction) {
    navigationAction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account'),
        backgroundColor: const Color(0xFFEFC94C),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          if (widget.userEmail != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child:
                        Icon(Icons.person, size: 40, color: Color(0xFFEFC94C)),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    widget.userEmail!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

          // Account menu items remain the same as in previous version
          // Each with a SnackBar to show "Coming Soon"
          AccountMenuItem(
            icon: Icons.person,
            title: 'My details',
            onTap: () => _navigateToScreen(() {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('My Details screen coming soon!')),
              );
            }),
          ),
          // ... (rest of the menu items remain the same)

          AccountMenuItem(
            icon: Icons.logout,
            title: 'Log out',
            onTap: _handleLogout,
          ),
        ],
      ),
    );
  }
}

class AccountMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const AccountMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}
