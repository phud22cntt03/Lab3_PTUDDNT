import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/history_provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculation History'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              Provider.of<HistoryProvider>(context, listen: false).clearHistory();
            },
          ),
        ],
      ),
      body: Consumer<HistoryProvider>(
        builder: (context, provider, child) {
          if (provider.history.isEmpty) {
            return Center(
              child: Text('No history available'),
            );
          }
          return ListView.builder(
            itemCount: provider.history.length,
            itemBuilder: (context, index) {
              final entry = provider.history[index];
              return ListTile(
                title: Text(entry.expression),
                subtitle: Text('${entry.result} - ${entry.timestamp}'),
                onTap: () {
                  // Reuse calculation
                  Navigator.pop(context, entry.expression);
                },
              );
            },
          );
        },
      ),
    );
  }
}