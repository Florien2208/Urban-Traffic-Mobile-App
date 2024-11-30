import 'package:first_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../widgets/onboarding_page.dart';
import '../models/onboarding_data.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<OnboardingData> _pages = [
    OnboardingData(
      title: 'Find the nearest\nparking lot',
      subtitle: 'Avoiding getting late by finding a\nparking spot near you',
      image: 'assets/car.png',
      iconWidget: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.cyan.withOpacity(0.3),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.search,
          color: Colors.cyan,
          size: 24,
        ),
      ),
    ),
    OnboardingData(
      title: 'Book your Slot\non the go',
      subtitle: 'Reserve your spot and enjoy hassle\nfree parking',
      image: 'assets/scooter.png',
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.cyan.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(
          Icons.local_activity_outlined,
          color: Colors.cyan,
          size: 24,
        ),
      ),
    ),
    OnboardingData(
      title: 'Book your Slot\non the go',
      subtitle: 'Reserve your spot and enjoy hassle\nfree parking',
      image: 'assets/scooter.png',
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.cyan.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(
          Icons.local_activity_outlined,
          color: Colors.cyan,
          size: 24,
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < _pages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      }
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _navigateToNextScreen() {
    _timer?.cancel();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SignupScreen()),
    );
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFC94C),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return OnboardingPage(data: _pages[index]);
                },
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left Arrow
                  IconButton(
                    onPressed: _currentPage > 0 ? _previousPage : null,
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: _currentPage > 0
                          ? Colors.white
                          : Colors.white.withOpacity(0.3),
                    ),
                  ),
                  // Page Indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _pages.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == index
                              ? Colors.white
                              : Colors.white.withOpacity(0.4),
                        ),
                      ),
                    ),
                  ),
                  // Right Arrow or Get Started
                  _currentPage == _pages.length - 1
                      ? TextButton(
                          onPressed: _navigateToNextScreen,
                          child: const Text(
                            'Start',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : IconButton(
                          onPressed: _nextPage,
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        ),
                ],
              ),
            ),
            const SizedBox(height: 30), // Additional bottom padding
          ],
        ),
      ),
    );
  }
}
