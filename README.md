# 🅿️ Parking Finder Onboarding Screen

## Overview

This Flutter application provides an engaging onboarding experience for a parking finder mobile app. The onboarding screen introduces users to the key features of the app through an interactive, auto-scrolling page view.

## 🌟 Features

### Smooth Page Navigation

- Automatic page rotation every 5 seconds
- Manual navigation with left and right arrow buttons
- Intuitive "Get Started" button on the final page

### Page Indicators

- Visual indicators show the current page
- Active page highlighted with a white dot
- Inactive pages shown with subtle, transparent dots

### Onboarding Slides

The app includes three onboarding slides:

1. **Find Nearest Parking Lot**

   - Helps users find parking spots quickly
   - Animated search icon
   - Subtitle explains the primary benefit

2. **Book Slot on the Go**
   - Demonstrates the app's booking capability
   - Activity icon highlights the feature
   - Emphasizes hassle-free parking

## 🛠 Technical Details

### Key Components

- `StatefulWidget` for managing page state
- `PageController` for page navigation
- `Timer` for automatic page rotation
- Custom `OnboardingData` model for slide content

### Navigation Methods

- `_startAutoPlay()`: Automatically rotates pages
- `_nextPage()`: Moves to the next page
- `_previousPage()`: Returns to the previous page
- `_navigateToNextScreen()`: Transitions to the main app screen

## 🎨 Design

- Background color: Vibrant yellow (`0xFFEFC94C`)
- White page indicators
- Cyan-themed icons
- Responsive layout

## 🚀 Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK

### Installation

1. Clone the repository
2. Run `flutter pub get`
3. Ensure assets are properly configured in `pubspec.yaml`

### Running the App

```bash
flutter run
```

## 📱 Screenshots

[Add screenshots of the onboarding screen]

## 🔧 Customization

- Easily modify onboarding pages in `_pages` list
- Adjust timer duration in `_startAutoPlay()`
- Customize navigation logic in `_navigateToNextScreen()`

## 📝 TODO

- Implement actual navigation to the main screen
- Add more onboarding slides if needed
- Enhance animations and transitions

## 🤝 Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## 📄 License

[Specify your license, e.g., MIT]
