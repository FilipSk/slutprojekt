import 'package:flutter/material.dart';

class UserButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color color;

  const UserButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 32),
        SizedBox(
          width: 375,
          height: 200,
          child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(backgroundColor: color),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
