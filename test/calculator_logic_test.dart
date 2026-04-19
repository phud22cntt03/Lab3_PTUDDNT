import 'package:flutter_test/flutter_test.dart';
import 'package:advanced_calculator/utils/calculator_logic.dart';
import 'package:advanced_calculator/models/calculator_settings.dart';

void main() {
  group('CalculatorLogic', () {
    test('addition', () {
      expect(CalculatorLogic.evaluate('2+3', AngleMode.degrees), '5.0');
    });

    test('subtraction', () {
      expect(CalculatorLogic.evaluate('5-3', AngleMode.degrees), '2.0');
    });

    test('multiplication', () {
      expect(CalculatorLogic.evaluate('2×3', AngleMode.degrees), '6.0');
    });

    test('division', () {
      expect(CalculatorLogic.evaluate('6÷2', AngleMode.degrees), '3.0');
    });

    test('complex expression', () {
      expect(CalculatorLogic.evaluate('(5+3)*2-4/2', AngleMode.degrees), '14.0');
    });

    test('invalid expression', () {
      expect(CalculatorLogic.evaluate('invalid', AngleMode.degrees), 'Error');
    });
  });
}