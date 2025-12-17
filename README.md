# All About Parrots 🦜 - Flutter Care App

A comprehensive Flutter mobile app for parrot owners with complete information on nutrition, behavior, toxic foods, home environment, toys and cages.

## Features

✅ **Parrot Management** - Add, view, and manage your parrots with species and age tracking
✅ **Nutrition Guide** - Complete dietary information and feeding guidelines  
✅ **Behavior Guide** - Understand parrot behaviors and how to respond
✅ **Toxic Foods** - Comprehensive list of foods to avoid with severity levels
✅ **Home Environment** - Safety requirements and optimal living conditions
✅ **Toys & Cages** - Enrichment options and cage sizing guide for different species

## App Screens

### 🏠 Home Screen
- Welcome section with app introduction
- Add new parrots (name, species, age)
- View and manage saved parrots
- Delete parrots from collection

### 🥗 Nutrition Screen
- Pellets, fresh fruits, vegetables
- Nuts & seeds, proteins, water
- Detailed benefits and dietary percentages

### 🧠 Behavior Screen
- Head bobbing, feather ruffling, eye pinning
- Screaming, beak grinding, wing flapping
- Meaning and appropriate responses

### ☠️ Toxic Foods Screen
- Dangerous foods: Avocado, chocolate, salt, caffeine, onions, garlic
- Toxin explanations
- Severity ratings (High/Medium/Low)

### 🏡 Home Environment Screen
- Temperature: 65-80°F (18-27°C)
- Humidity: 40-60% level
- Lighting: 10-12 hours daily
- Ventilation and space requirements
- Safety checklist

### 🎮 Toys & Cages Screen
- Enrichment toys: chew toys, swings, bells, foraging toys, mirrors
- Cage sizes by species (Budgies, Cockatiels, Macaws, Multiple birds)
- Care requirements for each

## Getting Started

### Prerequisites
- Flutter SDK 3.16.5 or later
- Dart 3.2.3 or later
- Chrome browser (for web) or Android/iOS emulator

### Installation

```bash
# Clone the repository
git clone <repo-url>
cd All_About_Parrots

# Get dependencies
flutter pub get

# Run the app
flutter run

# Or run on specific platform:
flutter run -d chrome          # Web
flutter run -d android          # Android emulator
flutter run -d ios              # iOS simulator
```

## Project Structure

```
.
├── lib/
│   └── main.dart          # Complete app with all screens
├── android/               # Android build files
├── ios/                   # iOS build files
├── web/                   # Web platform files
├── windows/               # Windows platform files
├── linux/                 # Linux platform files
├── macos/                 # macOS platform files
├── pubspec.yaml          # Dependencies and project config
└── README.md             # This file
```

## Dependencies

- Flutter Material Design (built-in)
- No external package dependencies for maximum compatibility

## Code Architecture

All screens and functionality are contained in `lib/main.dart` for simplicity:

- `MyApp` - Main app widget with theme configuration
- `HomeScreen` - Parrot management and navigation hub
- `NutritionScreen` - Expandable nutrition information
- `BehaviorScreen` - Parrot behavior guide
- `ToxicFoodsScreen` - Foods to avoid with severity ratings
- `EnvironmentScreen` - Home environment requirements
- `ToysCagesScreen` - Toys and cage information

## Supported Platforms

- ✅ Web (Chrome, Firefox, Safari)
- ✅ Android 
- ✅ iOS
- ✅ Windows
- ✅ Linux
- ✅ macOS

## Development

### Building for Production

```bash
# Web
flutter build web

# Android
flutter build apk

# iOS
flutter build ios

# Release build
flutter build web --release
```

### Code Style
- Follows Dart style guide
- Uses const constructors for performance
- Material Design 3 theme

## Future Enhancements

- 📱 Parrot care schedule/reminders
- 📷 Photo gallery for each parrot
- 🏥 Veterinary contact directory
- 🧬 Breeding information
- 🌍 Local parrot clubs finder
- 📊 Advanced nutrition calculator
- 🎥 Video guides and tutorials
- 📱 Local data persistence (Hive/SQLite)
- ☁️ Cloud sync for multiple devices

## Contributing

Pull requests are welcome! Feel free to submit issues and enhancement requests.

## License

This project is open source and available under the MIT License.

## Support

For questions, issues, or suggestions:
1. Open an issue on GitHub
2. Check existing documentation
3. Review the Flutter docs: https://flutter.dev

## Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Flutter API Reference](https://api.flutter.dev/)
- [Dart Documentation](https://dart.dev/guides)
- [Material Design Guidelines](https://material.io/design)

---

**Created:** December 17, 2025  
**Framework:** Flutter 3.16.5  
**Language:** Dart  
**Theme:** Material Design 3  
**Status:** Complete and functional
