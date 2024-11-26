import 'package:flutter/material.dart';

class ChargeScreen extends StatelessWidget {
  const ChargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   title: const Text('Charge'),
      //   backgroundColor: const Color(0xFFEFC94C),
      //   foregroundColor: Colors.white,
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.battery_charging_full,
              size: 100,
              color: Color(0xFFEFC94C),
            ),
            SizedBox(height: 20),
            Text(
              'Charge Your Vehicle',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Find and select a charging station',
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
