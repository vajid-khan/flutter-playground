import 'package:flutter/material.dart';

class BBButton extends StatelessWidget {
  const BBButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isPrimary = true,
    this.icon,
  });

  final void Function() onPressed;
  final String text;
  final bool isPrimary;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    var backgroundColor =
        isPrimary
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.surface;
    var foregroundColor =
        isPrimary ? Colors.white : Theme.of(context).colorScheme.primary;
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon ?? const SizedBox.shrink(),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: backgroundColor,
          foregroundColor: Colors.red,
        ),
        label: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: foregroundColor,
          ),
        ),
      ),
    );
  }
}
