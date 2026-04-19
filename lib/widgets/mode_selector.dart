import 'package:flutter/material.dart';
import '../models/calculator_mode.dart';

class ModeSelector extends StatelessWidget {
  final CalculatorMode currentMode;
  final Function(CalculatorMode) onModeChanged;

  const ModeSelector({
    Key? key,
    required this.currentMode,
    required this.onModeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: CalculatorMode.values.map((mode) {
        return Expanded(
          child: GestureDetector(
            onTap: () => onModeChanged(mode),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: currentMode == mode ? Theme.of(context).primaryColor : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                mode.name.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: currentMode == mode ? Colors.white : Theme.of(context).textTheme.bodyLarge?.color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}