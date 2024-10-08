import 'dart:ui';

enum Language {
  english(
    Locale('en', 'US'),
    'English',
  ),
  french(
    Locale('fr', 'FR'),
    'Français',
  );

  const Language(this.value, this.text);

  final Locale value;
  final String text;
}
