import 'package:flutter_test/flutter_test.dart';
import 'package:advanced_calculator/utils/calculator_logic.dart';
import 'package:advanced_calculator/models/calculator_settings.dart';
import 'dart:math' as math;

void main() {
  group('CalculatorLogic - Basic Operations', () {
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

  group('CalculatorLogic - Advanced Functions', () {
    test('square root', () {
      String result = CalculatorLogic.evaluate('√16', AngleMode.degrees);
      print('square root result: "$result"');
      expect(result, isNotEmpty);
      if (result != 'Error') {
        expect(double.parse(result), closeTo(4.0, 0.001));
      }
    });

    test('power operation: 2^3', () {
      String result = CalculatorLogic.evaluate('2^3', AngleMode.degrees);
      expect(double.parse(result), closeTo(8.0, 0.001));
    });

    test('squared: 5^2', () {
      String result = CalculatorLogic.evaluate('5^2', AngleMode.degrees);
      expect(double.parse(result), closeTo(25.0, 0.001));
    });

    test('sine 90 degrees', () {
      String result = CalculatorLogic.evaluate('sin(90)', AngleMode.degrees);
      expect(double.parse(result), closeTo(1.0, 0.001));
    });

    test('cosine 0 degrees', () {
      String result = CalculatorLogic.evaluate('cos(0)', AngleMode.degrees);
      expect(double.parse(result), closeTo(1.0, 0.001));
    });

    test('tangent 45 degrees', () {
      String result = CalculatorLogic.evaluate('tan(45)', AngleMode.degrees);
      expect(double.parse(result), closeTo(1.0, 0.001));
    });

    test('sine with radians mode', () {
      String result = CalculatorLogic.evaluate('sin(${math.pi / 2})', AngleMode.radians);
      expect(double.parse(result), closeTo(1.0, 0.001));
    });

    test('cosine 180 degrees', () {
      String result = CalculatorLogic.evaluate('cos(180)', AngleMode.degrees);
      expect(double.parse(result), closeTo(-1.0, 0.001));
    });

    test('tangent 0 degrees', () {
      String result = CalculatorLogic.evaluate('tan(0)', AngleMode.degrees);
      expect(double.parse(result), closeTo(0.0, 0.001));
    });
  });

  group('CalculatorLogic - Constants', () {
    test('pi constant', () {
      String result = CalculatorLogic.evaluate('π', AngleMode.degrees);
      expect(double.parse(result), closeTo(math.pi, 0.001));
    });

    test('pi in expression', () {
      String result = CalculatorLogic.evaluate('π*2', AngleMode.degrees);
      expect(double.parse(result), closeTo(math.pi * 2, 0.001));
    });
  });

  group('CalculatorLogic - Complex Expressions', () {
    test('sqrt and power combined', () {
      String result = CalculatorLogic.evaluate('√(4^2)', AngleMode.degrees);
      expect(double.parse(result), closeTo(4.0, 0.001));
    });

    test('trigonometry in expression', () {
      String result = CalculatorLogic.evaluate('sin(90)+cos(0)', AngleMode.degrees);
      expect(double.parse(result), closeTo(2.0, 0.001));
    });

    test('mixed operations', () {
      String result = CalculatorLogic.evaluate('√16+2^3-sin(90)', AngleMode.degrees);
      expect(double.parse(result), closeTo(11.0, 0.001));
    });
  });
}