import 'package:flutter/material.dart';
import '../models/calculation_history.dart';
import '../services/storage_service.dart';

class HistoryProvider with ChangeNotifier {
  final StorageService _storageService;
  List<CalculationHistory> _history = [];

  HistoryProvider(this._storageService) {
    loadHistory();
  }

  List<CalculationHistory> get history => _history;

  void addCalculation(String expression, String result) {
    final entry = CalculationHistory(
      expression: expression,
      result: result,
      timestamp: DateTime.now(),
    );
    _history.insert(0, entry);
    if (_history.length > 50) {
      _history = _history.sublist(0, 50);
    }
    _storageService.saveHistory(_history);
    notifyListeners();
  }

  void clearHistory() {
    _history.clear();
    _storageService.saveHistory(_history);
    notifyListeners();
  }

  void loadHistory() async {
    _history = await _storageService.loadHistory();
    notifyListeners();
  }
}