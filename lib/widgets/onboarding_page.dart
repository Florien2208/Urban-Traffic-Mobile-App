// lib/widgets/onboarding_page.dart
import 'package:flutter/material.dart';
import '../models/onboarding_data.dart'; // Updated import path

class OnboardingPage extends StatelessWidget {
  final OnboardingData data;

  const OnboardingPage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          data.iconWidget,
          const SizedBox(height: 40),
          Text(
            data.title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            data.subtitle,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black.withOpacity(0.7),
              height: 1.4,
            ),
          ),
          const Spacer(),
          Center(
            child: Image.asset(
              data.image,
              height: 200,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
