# Assignment 2 – Flutter APP UI

**Student:** Jannatul Mahia
**Student ID:** 2222222
**Email:** 2221709@iub.edu.bd

## Pages Implemented (all 4)
1. **Home** – Total balance card, quick actions, recent transactions
2. **Reports** – Monthly spending report + spending breakdown with progress bars
3. **Cards** – Bank card display, card actions, linked accounts
4. **Profile** – Student info (name, ID, email) and bio/story

Navigation between all 4 pages is implemented with **PageView + PageController**,
synced with the bottom **BottomNavigationBar** (see `lib/main.dart` → `MainScreen`).

## Project Structure
```
lib/
  main.dart               # App entry point + MainScreen (PageView/PageController)
  constants.dart          # Student info + app color palette (edit here to change info)
  widgets/
    app_header.dart       # Shared "Welcome back" header used on every page
  pages/
    home_page.dart         # Page 1
    reports_page.dart      # Page 2
    cards_page.dart        # Page 3
    profile_page.dart      # Page 4
```

## How to Run (first-time setup)

This repo currently ships the Dart/Flutter **source code only**
(`lib/`, `pubspec.yaml`, `analysis_options.yaml`, `.gitignore`). Since it was
generated outside of a machine with the Flutter SDK installed, the native
platform folders (`android/`, `ios/`, `web/`, etc.) are not included yet.
Generate them once on your own machine:

1. Install the Flutter SDK if you haven't already: https://docs.flutter.dev/get-started/install
2. From inside this project folder, run:
   ```bash
   flutter create .
   ```
   This adds the missing `android/`, `ios/`, `web/`, `windows/`, `macos/`,
   `linux/` folders without touching the existing `lib/` code.
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app on an emulator, simulator, or connected device:
   ```bash
   flutter run
   ```

## Editing Personal Info
All personal details live in **one file**: `lib/constants.dart`
(`StudentInfo` class). Change name/ID/email/bio there and it updates on the
Profile page and the Cards page cardholder name automatically.

## Submission Checklist (for GitHub / Google Classroom)
- [ ] Rename this repo to: `assignment-two-flutter_UI-Jannatul_Mahia-2222222`
- [ ] Push the **entire Flutter project** to GitHub (after running `flutter create .`)
- [ ] Make sure the GitHub repository is **Public**
- [ ] Do **NOT** upload the demo video to GitHub
- [ ] Record a mobile screen recording showing all 4 pages, navigation between
      them, and interactions (button taps, etc.)
- [ ] Upload the demo video separately to **Google Classroom**
