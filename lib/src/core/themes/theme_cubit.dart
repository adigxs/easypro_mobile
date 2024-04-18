import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit(BuildContext context) : super(_getSystemTheme(context));

  static ThemeData _lightTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: Colors.transparent,
      ),
      primaryColor: const Color(0xFF008000),
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          background: Color(0xFFFFFFFF),
          onBackground: Color(0xFF000000),
          primary: Color(0xFF008000),
          onPrimary: Color(0xFFFEEEEE),
          surface: Color(0xFF91919F),
          onSurface: Color(0xFFFAFBFC),
          secondary: Color(0xFF9E9E9E),
          onSecondary: Color(0xFF000000),
          error: Color(0xFFFF1744),
          onError: Color(0xFFAC4040),
          onSecondaryContainer: Color(0xFF090D20),
          onPrimaryContainer: Color(0xFF9747FF),
          outline: Color.fromARGB(255, 255, 183, 0)),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.black,
      ),
      brightness: Brightness.light,
    ).copyWith(textTheme: _buildTextTheme(context: context));
  }

  static ThemeData _darkTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.transparent,
      ),
      primaryColor: const Color(0xFF008000),
      colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          background: Color(0xFFFFFFFF),
          onBackground: Color(0xFF000000),
          primary: Color(0xFF008000),
          onPrimary: Color(0xFFFEEEEE),
          surface: Color(0xFF91919F),
          onSurface: Color(0xFFFAFBFC),
          secondary: Color(0xFF9E9E9E),
          onSecondary: Color(0xFF000000),
          error: Color(0xFFFF1744),
          onError: Color(0xFFAC4040),
          onSecondaryContainer: Color(0xFF090D20),
          onPrimaryContainer: Color(0xFF9747FF),
          outline: Color.fromARGB(255, 255, 183, 0)),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.black,
      ),
      brightness: Brightness.dark,
    ).copyWith(textTheme: _buildTextTheme(context: context));
  }

  static TextTheme _buildTextTheme({required BuildContext context}) {
    return const TextTheme(
      displayLarge: TextStyle(
        fontSize: 60,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: TextStyle(
        fontSize: 58,
        fontWeight: FontWeight.w500,
      ),
      displaySmall: TextStyle(
        fontSize: 38,
        fontWeight: FontWeight.w700,
      ),
      headlineLarge: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w400,
      ),
      headlineSmall: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: TextStyle(
        fontSize: 18 /*.w(context)*/,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontSize: 16 /*.w(context)*/,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontSize: 12 /*.w(context)*/,
        fontWeight: FontWeight.w400,
      ),
    ).apply(fontFamily: 'Inter');
  }

  static ThemeData _getSystemTheme(BuildContext context) {
    // ignore: deprecated_member_use
    final brightness = MediaQueryData.fromView(WidgetsBinding.instance.window)
        .platformBrightness;

    return brightness == Brightness.light
        ? _lightTheme(context)
        : _darkTheme(context);
  }

  void toggleTheme(BuildContext context) {
    emit(state.brightness == Brightness.dark
        ? _lightTheme(context)
        : _darkTheme(context));
  }
}
