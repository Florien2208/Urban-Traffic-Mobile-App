import 'package:flutter/material.dart';

class ParkScreen extends StatelessWidget {
  const ParkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Park'),
        backgroundColor: const Color(0xFFEFC94C),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.local_parking,
              size: 100,
              color: Color(0xFFEFC94C),
            ),
            SizedBox(height: 20),
            Text(
              'Find Parking',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Locate and reserve parking spots',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
