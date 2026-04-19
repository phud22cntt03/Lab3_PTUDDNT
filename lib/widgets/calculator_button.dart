import 'package:flutter/material.dart';
import '../utils/constants.dart';

class CalculatorButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;

  const CalculatorButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
  }) : super(key: key);

  @override
  _CalculatorButtonState createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: AppConstants.animationDuration,
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
    widget.onPressed();
  }

  void _onTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: SizedBox(
              height: 60,
              child: Container(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: widget.backgroundColor ?? Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(AppConstants.buttonBorderRadius),
                ),
                child: Center(
                  child: Text(
                    widget.text,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: widget.fontSize ?? 16,
                      color: widget.textColor ?? Theme.of(context).colorScheme.onSecondary,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}