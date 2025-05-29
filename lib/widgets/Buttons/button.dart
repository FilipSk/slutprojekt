import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({required this.icon,required this.onPressed, required this.color,super.key});

  final void Function() onPressed;
  final Icon icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
                      onPressed: () {
                        onPressed();
                      },
                      label:icon,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: color,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
  }
}