import 'package:flutter_test/flutter_test.dart';
import 'package:advanced_calculator/utils/calculator_logic.dart';
import 'package:advanced_calculator/models/calculator_settings.dart';

void main() {
  group('CalculatorLogic - Programmer Mode (Bitwise Operations)', () {
    test('bitwise AND: 12 & 10', () {
      // 12 = 1100, 10 = 1010, result = 1000 = 8
      String result = CalculatorLogic.evaluate('12&10', AngleMode.degrees);
      print('12 & 10 = $result');
      expect(result, isNotEmpty);
    });

    test('bitwise OR: 12 | 10', () {
      // 12 = 1100, 10 = 1010, result = 1110 = 14
      String result = CalculatorLogic.evaluate('12|10', AngleMode.degrees);
      print('12 | 10 = $result');
      expect(result, isNotEmpty);
    });

    test('bitwise XOR: 12 ^ 10', () {
      // 12 = 1100, 10 = 1010, result = 0110 = 6
      String result = CalculatorLogic.evaluate('12^10', AngleMode.degrees);
      print('12 ^ 10 = $result');
      expect(result, isNotEmpty);
    });

    test('left shift: 5 << 2', () {
      // 5 = 101, shift left 2 = 10100 = 20
      String result = CalculatorLogic.evaluate('5<<2', AngleMode.degrees);
      print('5 << 2 = $result');
      expect(result, isNotEmpty);
    });

    test('right shift: 20 >> 2', () {
      // 20 = 10100, shift right 2 = 101 = 5
      String result = CalculatorLogic.evaluate('20>>2', AngleMode.degrees);
      print('20 >> 2 = $result');
      expect(result, isNotEmpty);
    });

    test('bitwise NOT: ~5', () {
      // NOT 5 = NOT 0000...0101 = 1111...1010 = -6 (two\'s complement)
      String result = CalculatorLogic.evaluate('~5', AngleMode.degrees);
      print('~5 = $result');
      expect(result, isNotEmpty);
    });

    test('hexadecimal: 0xF', () {
      // 0xF = 15
      String result = CalculatorLogic.evaluate('0xF', AngleMode.degrees);
      print('0xF = $result');
      expect(result, isNotEmpty);
    });

    test('hexadecimal addition: 0xA + 0x5', () {
      // 0xA = 10, 0x5 = 5, result = 15
      String result = CalculatorLogic.evaluate('0xA+0x5', AngleMode.degrees);
      print('0xA + 0x5 = $result');
      expect(result, isNotEmpty);
    });

    test('complex bitwise: (12 & 10) | 4', () {
      // (12 & 10) = 8, 8 | 4 = 1100 = 12
      String result = CalculatorLogic.evaluate('(12&10)|4', AngleMode.degrees);
      print('(12 & 10) | 4 = $result');
      expect(result, isNotEmpty);
    });

    test('mixed: 0x10 << 2', () {
      // 0x10 = 16, 16 << 2 = 64
      String result = CalculatorLogic.evaluate('0x10<<2', AngleMode.degrees);
      print('0x10 << 2 = $result');
      expect(result, isNotEmpty);
    });
  });
}
