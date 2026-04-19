import 'package:flutter/material.dart';
import '../models/calculator_mode.dart';
import 'calculator_button.dart';

class ButtonGrid extends StatelessWidget {
  final CalculatorMode mode;
  final Function(String) onButtonPressed;

  const ButtonGrid({
    Key? key,
    required this.mode,
    required this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List<String>> buttons;

    switch (mode) {
      case CalculatorMode.basic:
        buttons = [
          ['C', 'CE', '%', '÷'],
          ['7', '8', '9', '×'],
          ['4', '5', '6', '-'],
          ['1', '2', '3', '+'],
          ['±', '0', '.', '='],
        ];
        break;
      case CalculatorMode.scientific:
        buttons = [
          ['2nd', 'sin', 'cos', 'tan', 'Ln', 'log'],
          ['x²', '√', 'x^y', '(', ')', '÷'],
          ['MC', '7', '8', '9', 'C', '×'],
          ['MR', '4', '5', '6', 'CE', '-'],
          ['M+', '1', '2', '3', '%', '+'],
          ['M-', '±', '0', '.', 'Π', '='],
        ];
        break;
      case CalculatorMode.programmer:
        // Simplified for now
        buttons = [
          ['AND', 'OR', 'XOR', 'NOT', '<<', '>>'],
          ['A', 'B', 'C', 'D', 'E', 'F'],
          ['MC', '7', '8', '9', 'C', '×'],
          ['MR', '4', '5', '6', 'CE', '-'],
          ['M+', '1', '2', '3', '%', '+'],
          ['M-', '±', '0', '.', 'BIN', '='],
        ];
        break;
    }

    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.all(24),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: buttons[0].length,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: buttons.expand((row) => row).length,
        itemBuilder: (context, index) {
          int row = index ~/ buttons[0].length;
          int col = index % buttons[0].length;
          String buttonText = buttons[row][col];
          return CalculatorButton(
            text: buttonText,
            onPressed: () => onButtonPressed(buttonText),
          );
        },
      ),
    );
  }
}