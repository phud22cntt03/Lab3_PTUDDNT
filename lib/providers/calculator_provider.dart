import 'package:flutter/material.dart';
import '../models/calculator_mode.dart';
import '../models/calculator_settings.dart';
import '../utils/calculator_logic.dart';

class CalculatorProvider with ChangeNotifier {
  CalculatorMode _mode = CalculatorMode.basic;
  String _expression = '';
  String _result = '';
  double? _memory;
  AngleMode _angleMode = AngleMode.degrees;

  CalculatorMode get mode => _mode;
  String get expression => _expression;
  String get result => _result;
  double? get memory => _memory;
  AngleMode get angleMode => _angleMode;

  void setMode(CalculatorMode mode) {
    _mode = mode;
    notifyListeners();
  }

  void appendToExpression(String value) {
    _expression += value;
    notifyListeners();
  }

  void clear() {
    _expression = '';
    _result = '';
    notifyListeners();
  }

  void clearEntry() {
    if (_expression.isNotEmpty) {
      _expression = _expression.substring(0, _expression.length - 1);
      notifyListeners();
    }
  }

  void calculate() {
    try {
      _result = CalculatorLogic.evaluate(_expression, _angleMode);
      notifyListeners();
    } catch (e) {
      _result = 'Error';
      notifyListeners();
    }
  }

  void memoryAdd() {
    if (_result.isNotEmpty && _result != 'Error') {
      double value = double.tryParse(_result) ?? 0;
      _memory = (_memory ?? 0) + value;
      notifyListeners();
    }
  }

  void memorySubtract() {
    if (_result.isNotEmpty && _result != 'Error') {
      double value = double.tryParse(_result) ?? 0;
      _memory = (_memory ?? 0) - value;
      notifyListeners();
    }
  }

  void memoryRecall() {
    if (_memory != null) {
      _expression += _memory.toString();
      notifyListeners();
    }
  }

  void memoryClear() {
    _memory = null;
    notifyListeners();
  }

  void setAngleMode(AngleMode mode) {
    _angleMode = mode;
    notifyListeners();
  }
}