import 'package:math_expressions/math_expressions.dart';
import 'dart:math' as math;
import '../models/calculator_settings.dart';

class ExpressionParser {
  static double evaluate(String expression, AngleMode angleMode) {
    try {
      // Normalize operator symbols
      String processedExpression = expression
          .replaceAll('×', '*')
          .replaceAll('÷', '/');
      
      // Handle sqrt: √(x) or √x -> sqrt(x)
      // Match √ followed by a number/variable/parenthesis
      processedExpression = processedExpression.replaceAllMapped(
        RegExp(r'√\(([^)]+)\)'),  // √(something)
        (match) => 'sqrt(${match.group(1)})',
      );
      processedExpression = processedExpression.replaceAllMapped(
        RegExp(r'√(\d+)'),  // √number (like √16)
        (match) => 'sqrt(${match.group(1)})',
      );
      
      // Handle trigonometric functions with degree conversion
      if (angleMode == AngleMode.degrees) {
        processedExpression = _convertTrigoFunctionsToDegrees(processedExpression);
      }
      
      // Replace π symbol
      processedExpression = processedExpression.replaceAll('π', 'pi');

      // Parse and evaluate
      Parser p = Parser();
      Expression exp = p.parse(processedExpression);
      
      // Create context model with pi and e constants
      ContextModel cm = ContextModel();
      cm.bindVariable(Variable('pi'), Number(math.pi));
      cm.bindVariable(Variable('e'), Number(math.e));
      
      return exp.evaluate(EvaluationType.REAL, cm);
    } catch (e) {
      throw Exception('Invalid expression: $e');
    }
  }

  static String _convertTrigoFunctionsToDegrees(String expression) {
    // Convert degrees to radians: degrees * pi / 180
    // Pattern: sin(45) -> sin(45*pi/180)
    
    expression = expression.replaceAllMapped(
      RegExp(r'sin\(([^)]+)\)'),
      (match) => 'sin((${match.group(1)})*pi/180)',
    );
    
    expression = expression.replaceAllMapped(
      RegExp(r'cos\(([^)]+)\)'),
      (match) => 'cos((${match.group(1)})*pi/180)',
    );
    
    expression = expression.replaceAllMapped(
      RegExp(r'tan\(([^)]+)\)'),
      (match) => 'tan((${match.group(1)})*pi/180)',
    );

    return expression;
  }
}