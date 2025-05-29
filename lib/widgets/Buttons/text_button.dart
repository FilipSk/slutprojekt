import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  const ButtonText({super.key, required this.onPressed, required this.text, required this.size, required this.color});
  final void Function() onPressed;
  final Text text;
  final double size;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
                      onPressed: () {
                        onPressed();
                      },
                      label:text,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: color,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                        textStyle: TextStyle(
                          fontSize: size,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
  }
}