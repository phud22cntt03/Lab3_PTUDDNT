import 'package:flutter/material.dart';

enum AngleMode { degrees, radians }

class CalculatorSettings {
  final ThemeMode themeMode;
  final int decimalPrecision;
  final AngleMode angleMode;
  final bool hapticFeedback;
  final bool soundEffects;
  final int historySize;

  CalculatorSettings({
    this.themeMode = ThemeMode.system,
    this.decimalPrecision = 2,
    this.angleMode = AngleMode.degrees,
    this.hapticFeedback = true,
    this.soundEffects = false,
    this.historySize = 50,
  });

  CalculatorSettings copyWith({
    ThemeMode? themeMode,
    int? decimalPrecision,
    AngleMode? angleMode,
    bool? hapticFeedback,
    bool? soundEffects,
    int? historySize,
  }) {
    return CalculatorSettings(
      themeMode: themeMode ?? this.themeMode,
      decimalPrecision: decimalPrecision ?? this.decimalPrecision,
      angleMode: angleMode ?? this.angleMode,
      hapticFeedback: hapticFeedback ?? this.hapticFeedback,
      soundEffects: soundEffects ?? this.soundEffects,
      historySize: historySize ?? this.historySize,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'themeMode': themeMode.name,
      'decimalPrecision': decimalPrecision,
      'angleMode': angleMode.name,
      'hapticFeedback': hapticFeedback,
      'soundEffects': soundEffects,
      'historySize': historySize,
    };
  }

  factory CalculatorSettings.fromJson(Map<String, dynamic> json) {
    return CalculatorSettings(
      themeMode: ThemeMode.values.firstWhere((e) => e.name == json['themeMode']),
      decimalPrecision: json['decimalPrecision'],
      angleMode: AngleMode.values.firstWhere((e) => e.name == json['angleMode']),
      hapticFeedback: json['hapticFeedback'],
      soundEffects: json['soundEffects'],
      historySize: json['historySize'],
    );
  }
}