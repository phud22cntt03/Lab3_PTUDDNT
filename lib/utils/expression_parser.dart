import 'package:math_expressions/math_expressions.dart';
import '../models/calculator_settings.dart';

class ExpressionParser {
  static double evaluate(String expression, AngleMode angleMode) {
    try {
      // Normalize operator symbols and constants
      String processedExpression = expression
          .replaceAll('×', '*')
          .replaceAll('÷', '/')
          .replaceAll('π', 'pi')
          .replaceAll('e', 'e')
          .replaceAll('√', 'sqrt')
          .replaceAll('ln', 'ln')
          .replaceAll('log', 'log10')
          .replaceAll('sin', angleMode == AngleMode.degrees ? 'sin(rad(' : 'sin(')
          .replaceAll('cos', angleMode == AngleMode.degrees ? 'cos(rad(' : 'cos(')
          .replaceAll('tan', angleMode == AngleMode.degrees ? 'tan(rad(' : 'tan(');

      // Handle degrees for trig functions
      if (angleMode == AngleMode.degrees) {
        processedExpression = processedExpression.replaceAll('sin(rad(', 'sin(rad(');
        processedExpression = processedExpression.replaceAll('cos(rad(', 'cos(rad(');
        processedExpression = processedExpression.replaceAll('tan(rad(', 'tan(rad(');
      }

      // Parse and evaluate
      Parser p = Parser();
      Expression exp = p.parse(processedExpression);
      ContextModel cm = ContextModel();
      return exp.evaluate(EvaluationType.REAL, cm);
    } catch (e) {
      throw Exception('Invalid expression');
    }
  }
}