import 'package:flutter/material.dart';
import '../utils/constants.dart';

class DisplayArea extends StatelessWidget {
  final String expression;
  final String result;

  const DisplayArea({
    Key? key,
    required this.expression,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppConstants.screenPadding),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(AppConstants.displayBorderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              child: Text(
                expression,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 18,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            result.isEmpty ? '0' : result,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 32,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}