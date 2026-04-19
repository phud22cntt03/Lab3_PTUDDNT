import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/calculator_provider.dart';
import '../providers/history_provider.dart';
import '../widgets/display_area.dart';
import '../widgets/button_grid.dart';
import '../widgets/mode_selector.dart';
import 'history_screen.dart';
import 'settings_screen.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  void _onButtonPressed(BuildContext context, String button) {
    final provider = Provider.of<CalculatorProvider>(context, listen: false);
    final historyProvider = Provider.of<HistoryProvider>(context, listen: false);
    switch (button) {
      case 'C':
        provider.clear();
        break;
      case 'CE':
        provider.clearEntry();
        break;
      case '=':
        provider.calculate();
        if (provider.result != 'Error' && provider.expression.isNotEmpty) {
          historyProvider.addCalculation(provider.expression, provider.result);
        }
        break;
      case 'MC':
        provider.memoryClear();
        break;
      case 'MR':
        provider.memoryRecall();
        break;
      case 'M+':
        provider.memoryAdd();
        break;
      case 'M-':
        provider.memorySubtract();
        break;
      default:
        provider.appendToExpression(button);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Advanced Calculator'),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HistoryScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Consumer<CalculatorProvider>(
            builder: (context, provider, child) {
              return ModeSelector(
                currentMode: provider.mode,
                onModeChanged: (mode) => provider.setMode(mode),
              );
            },
          ),
          Expanded(
            flex: 1,
            child: Consumer<CalculatorProvider>(
              builder: (context, provider, child) {
                return DisplayArea(
                  expression: provider.expression,
                  result: provider.result,
                );
              },
            ),
          ),
          Consumer<CalculatorProvider>(
            builder: (context, provider, child) {
              return ButtonGrid(
                mode: provider.mode,
                onButtonPressed: (button) => _onButtonPressed(context, button),
              );
            },
          ),
        ],
      ),
    );
  }
}