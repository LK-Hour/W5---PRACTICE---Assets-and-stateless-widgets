# 🎨 Flutter UI Components Practice

[![Flutter Version](https://img.shields.io/badge/Flutter-3.9.2-02569B?logo=flutter)](https://flutter.dev)
[![Dart Version](https://img.shields.io/badge/Dart-3.9.2-0175C2?logo=dart)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

A comprehensive Flutter practice project demonstrating **stateless widgets**, **asset management**, and **modern UI design patterns**. This repository contains 4 progressive exercises showcasing best practices in Flutter development.

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Features](#-features)
- [Project Structure](#-project-structure)
- [Exercises](#-exercises)
- [Getting Started](#-getting-started)
- [Screenshots](#-screenshots)
- [Key Learnings](#-key-learnings)
- [Technologies Used](#-technologies-used)
- [Contributing](#-contributing)
- [License](#-license)

---

## 🎯 Overview

This project is part of **Week 5 Practice** focused on mastering Flutter fundamentals:

- **Stateless Widgets**: Building reusable, immutable UI components
- **Asset Management**: Integrating images and icons efficiently
- **Modern Design**: Creating beautiful, gradient-based interfaces
- **Code Organization**: Using enums, custom widgets, and best practices

Perfect for learners transitioning from basic Flutter concepts to intermediate-level UI development! 🚀

---

## ✨ Features

### 🔹 Core Capabilities

- **Reusable Widget Architecture** - DRY principles with custom stateless widgets
- **Type-Safe Enums** - Leveraging Dart 3.0 enhanced enums for data modeling
- **Asset Integration** - Properly configured image assets with error handling
- **Gradient Backgrounds** - Beautiful linear gradients for modern aesthetics
- **Responsive Layouts** - Flexible designs that adapt to content
- **Material Design 3** - Following latest Material Design guidelines

### 🔹 Advanced Features

- Custom button components with icon positioning
- Product card layouts with image-text composition
- Weather forecast cards with dynamic data
- Elevation and shadow effects using `PhysicalModel`
- Circular avatar images with `ClipOval`
- Navigation drawer integration

---

## 📁 Project Structure

```
lib/
├── main.dart                    # Main weather app (polished version)
├── EX-1/
│   ├── main_part1.dart         # Basic hobby card
│   └── main_part2.dart         # Reusable hobby card widget
├── EX-2/
│   └── main.dart               # Custom button components
├── EX-3/
│   ├── main_part1.dart         # Basic product card
│   ├── main_part2.dart         # Product enum introduction
│   └── main_part3.dart         # Complete product card system
└── EX-4/
    └── main.dart               # Weather forecast app

assets/
├── cloudy.png
├── dart.png
├── firebase.png
├── flutter.png
├── sunny.png
├── sunnyCloudy.png
└── veryCloudy.png
```

---

## 📚 Exercises

### 🏖️ Exercise 1: Hobby Cards
**Focus**: Container styling, Row layouts, and basic widgets

**Part 1**: Single hardcoded hobby card  
**Part 2**: Reusable `HobbyCard` widget with customizable properties

```dart
HobbyCard(
  title: "Travel",
  icon: Icons.travel_explore,
  color: Colors.green,
)
```

**Key Concepts**:
- Container decoration with `BorderRadius`
- Icon and Text composition
- Color customization

---

### 🎛️ Exercise 2: Custom Buttons
**Focus**: Enums, conditional rendering, and button states

Features:
- ✅ Three button types: Primary, Secondary, Disabled
- ✅ Icon positioning (left/right)
- ✅ Dynamic styling based on button type
- ✅ State management for disabled buttons

```dart
CustomButton(
  label: "Submit",
  icon: Icons.check,
  iconPosition: IconPosition.left,
  buttonType: ButtonType.primary,
)
```

**Key Concepts**:
- Enum-based configuration
- ElevatedButton styling
- Conditional widget lists
- Switch expressions

---

### 🛍️ Exercise 3: Product Cards
**Focus**: Asset integration, Card widgets, and enum data models

**Progression**:
1. **Part 1**: Hardcoded product card with image
2. **Part 2**: Product enum with metadata
3. **Part 3**: Dynamic `ProductCard` widget

```dart
enum Product {
  dart(
    title: 'Dart',
    description: 'the best object language',
    imagePath: 'assets/dart.png',
  ),
  // ...
}
```

**Key Concepts**:
- Asset loading with `Image.asset()`
- Card elevation and shadows
- Enum with properties
- Widget extraction

---

### 🌤️ Exercise 4: Weather Forecast
**Focus**: Advanced layouts, gradients, and complex data modeling

**Features**:
- 🌈 Gradient backgrounds per weather type
- 🌡️ Temperature display (min/max/current)
- 🎨 Circular weather icons
- ✨ Decorative background elements
- 📱 Responsive card design

```dart
enum WeatherType {
  sunny(
    iconPath: 'assets/sunny.png',
    gradient: LinearGradient(/* ... */),
  ),
  // ...
}

enum CityWeather {
  phnomPenh(
    cityName: 'Phnom Penh',
    minTemp: 10.0,
    maxTemp: 30.0,
    currentTemp: 12.2,
    weatherType: WeatherType.cloudy,
  ),
  // ...
}
```

**Key Concepts**:
- Nested enums for composition
- `Stack` and `Positioned` widgets
- `PhysicalModel` for elevation
- `LinearGradient` backgrounds
- `ClipRRect` and `ClipOval` for rounded shapes
- Modern color APIs (`withValues()`)

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK: `>=3.9.2`
- Dart SDK: `>=3.9.2`
- VS Code / Android Studio / IntelliJ IDEA
- Chrome / Android Emulator / iOS Simulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/LK-Hour/W5---PRACTICE---Assets-and-stateless-widgets.git
   cd W5---PRACTICE---Assets-and-stateless-widgets
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Verify installation**
   ```bash
   flutter doctor
   ```

### Running the App

**Run specific exercises:**

```bash
# Main weather app
flutter run

# Exercise 1 - Part 1
flutter run -t lib/EX-1/main_part1.dart

# Exercise 1 - Part 2
flutter run -t lib/EX-1/main_part2.dart

# Exercise 2
flutter run -t lib/EX-2/main.dart

# Exercise 3 - Part 1
flutter run -t lib/EX-3/main_part1.dart

# Exercise 3 - Part 2
flutter run -t lib/EX-3/main_part2.dart

# Exercise 3 - Part 3
flutter run -t lib/EX-3/main_part3.dart

# Exercise 4
flutter run -t lib/EX-4/main.dart
```

**Run on specific device:**
```bash
flutter run -d chrome              # Web
flutter run -d macos               # macOS
flutter run -d <device-id>         # Physical device
```

---

## 📸 Screenshots

### 🌤️ Weather Forecast App (Main)
Beautiful gradient cards displaying weather information for multiple cities.

### 🎛️ Custom Buttons (EX-2)
Three button variants with flexible icon positioning.

### 🛍️ Product Cards (EX-3)
Elegant product display with images and descriptions.

### 🏖️ Hobby Cards (EX-1)
Simple, colorful cards for hobby representation.

---

## 🎓 Key Learnings

### 1. **Stateless Widget Best Practices**
- Keep widgets small and focused
- Use `const` constructors for performance
- Extract reusable components early

### 2. **Enhanced Enums (Dart 3.0)**
```dart
enum WeatherType {
  sunny(iconPath: 'assets/sunny.png', gradient: /* ... */);
  
  const WeatherType({required this.iconPath, required this.gradient});
  
  final String iconPath;
  final LinearGradient gradient;
}
```

### 3. **Asset Management**
```yaml
# pubspec.yaml
flutter:
  assets:
    - assets/
```

### 4. **Modern Color APIs**
```dart
// ✅ New way (no precision loss)
Colors.white.withValues(alpha: 0.5)

// ❌ Old way (deprecated)
Colors.white.withOpacity(0.5)
Colors.white.withAlpha(128)
```

### 5. **Layout Composition**
- Use `Stack` for overlapping widgets
- `Positioned` for absolute positioning
- `Row` and `Column` for linear layouts
- `Expanded` and `Flexible` for responsive sizing

### 6. **Styling Patterns**
- `BoxDecoration` for containers
- `PhysicalModel` for material elevation
- `ClipRRect` / `ClipOval` for clipping shapes
- `LinearGradient` for beautiful backgrounds

---

## 🛠️ Technologies Used

| Technology | Purpose |
|------------|---------|
| **Flutter** | UI framework |
| **Dart** | Programming language |
| **Material Design 3** | Design system |
| **Assets** | Image resources |
| **Device Preview** | Multi-device testing |

### Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  device_preview: ^1.3.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
```

---

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/AmazingFeature`)
3. **Commit** your changes (`git commit -m 'Add some AmazingFeature'`)
4. **Push** to the branch (`git push origin feature/AmazingFeature`)
5. **Open** a Pull Request

### Code Style

- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Use meaningful variable names
- Add comments for complex logic
- Keep widgets small and focused

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Author

**LK-Hour**
- GitHub: [@LK-Hour](https://github.com/LK-Hour)
- Repository: [W5---PRACTICE---Assets-and-stateless-widgets](https://github.com/LK-Hour/W5---PRACTICE---Assets-and-stateless-widgets)

---

## 🌟 Acknowledgments

- Flutter Team for excellent documentation
- Material Design for design guidelines
- CADT for the structured learning path
- Flutter community for inspiration

---

## 📚 Additional Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Material Design 3](https://m3.material.io/)
- [Flutter Widget Catalog](https://docs.flutter.dev/ui/widgets)

---

<div align="center">

**⭐ If you found this helpful, please star the repository! ⭐**

Made with ❤️ using Flutter

</div>
