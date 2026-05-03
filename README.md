# BMI Calculator App

Simple **Flutter** app that computes Body Mass Index (BMI) from height, weight, age, and gender, shows the result on a gauge, and surfaces category-based wellness tips.

## Preview

![App preview](./app_preview.gif)

## Features

- Pick gender (male/female UI)
- Adjust height (cm), weight (kg), and age
- **Calculate** BMI and open a dedicated result screen
- BMI category bands (thin through obese classes) with color styling
- Gauged result view plus short dietary and lifestyle guidance per category
- **Reset** from the app bar to restore defaults

> **Disclaimer:** BMI is a general screening metric, not a medical diagnosis. For personal health decisions, consult a qualified professional.

## Requirements

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (this project targets Dart `^3.11.5` per `pubspec.yaml`)

## Getting started

Clone the repo, then from the project root:

```bash
flutter pub get
flutter run
```

Choose your device or emulator when prompted.

## Project layout

| Path | Role |
|------|------|
| `lib/main.dart` | App entry and `MaterialApp` |
| `lib/first_screen.dart` | Input screen (gender, sliders, calculate) |
| `lib/result_screen.dart` | Result screen with gauge and tips |
| `lib/bmi_calculator.dart` | BMI category logic and advice content |

## Credits

**UI Design:** [BMI Calculator Mobile App UI Design](https://dribbble.com/shots/22451667-BMI-Calculator-Mobile-App-UI-Design) on Dribbble

---

Built as part of learning **Flutter**.
