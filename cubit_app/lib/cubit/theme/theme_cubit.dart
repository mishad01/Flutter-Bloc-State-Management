import 'package:cubit_counter_app/cubit/theme/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeState> {
  static final ThemeData _lightTheme = ThemeData.light();
  static final ThemeData _darkTheme = ThemeData.dark();
  ThemeCubit() : super(ThemeState(_lightTheme));

  void toggleTheme(bool isDark) {
    final themeData = isDark ? _darkTheme : _lightTheme;
    emit(ThemeState(themeData));
    _saveTheme(isDark);
  }

  Future<void> _saveTheme(bool isDark) async {
    // Get an instance of SharedPreferences (local key-value storage)
    final preferences = await SharedPreferences.getInstance();
    // Save the boolean value (true for dark mode, false for light mode) under the key 'isDark'
    await preferences.setBool('isDark', isDark);
  }

  static Future<bool> _loadTheme() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool('isDark') ?? false;
  }

  Future<void> setInitialTheme() async {
    final isDark = await _loadTheme();
    final themeData = isDark ? _darkTheme : _lightTheme;
    emit(ThemeState(themeData));
  }
}
