import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Theme'),
            trailing: DropdownButton<ThemeMode>(
              value: Provider.of<ThemeProvider>(context).themeMode,
              onChanged: (value) {
                if (value != null) {
                  Provider.of<ThemeProvider>(context, listen: false).setThemeMode(value);
                }
              },
              items: ThemeMode.values.map((mode) {
                return DropdownMenuItem(
                  value: mode,
                  child: Text(mode.name),
                );
              }).toList(),
            ),
          ),
          // Add more settings here
        ],
      ),
    );
  }
}