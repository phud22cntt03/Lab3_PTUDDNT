import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/calculation_history.dart';
import '../models/calculator_settings.dart';

class StorageService {
  static const String _historyKey = 'calculation_history';
  static const String _settingsKey = 'calculator_settings';
  static const String _memoryKey = 'memory_value';

  Future<void> saveHistory(List<CalculationHistory> history) async {
    final prefs = await SharedPreferences.getInstance();
    final historyJson = history.map((e) => e.toJson()).toList();
    await prefs.setString(_historyKey, jsonEncode(historyJson));
  }

  Future<List<CalculationHistory>> loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final historyString = prefs.getString(_historyKey);
    if (historyString != null) {
      final historyJson = jsonDecode(historyString) as List;
      return historyJson.map((e) => CalculationHistory.fromJson(e)).toList();
    }
    return [];
  }

  Future<void> saveSettings(CalculatorSettings settings) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_settingsKey, jsonEncode(settings.toJson()));
  }

  Future<CalculatorSettings> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final settingsString = prefs.getString(_settingsKey);
    if (settingsString != null) {
      final settingsJson = jsonDecode(settingsString);
      return CalculatorSettings.fromJson(settingsJson);
    }
    return CalculatorSettings();
  }

  Future<void> saveMemory(double? memory) async {
    final prefs = await SharedPreferences.getInstance();
    if (memory != null) {
      await prefs.setDouble(_memoryKey, memory);
    } else {
      await prefs.remove(_memoryKey);
    }
  }

  Future<double?> loadMemory() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_memoryKey);
  }
}