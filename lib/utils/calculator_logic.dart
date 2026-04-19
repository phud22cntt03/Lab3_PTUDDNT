import 'expression_parser.dart';
import '../models/calculator_settings.dart';

class CalculatorLogic {
  static String evaluate(String expression, AngleMode angleMode) {
    try {
      double result = ExpressionParser.evaluate(expression, angleMode);
      return result.toString();
    } catch (e) {
      return 'Error';
    }
  }
}