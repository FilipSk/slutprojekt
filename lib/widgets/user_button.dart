import 'package:flutter/material.dart';

class UserButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color color;
  final Icon icon;

  const UserButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 32),
        SizedBox(
          width: 425,
          height: 200,
          child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(backgroundColor: color),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
