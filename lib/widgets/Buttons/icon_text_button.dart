import 'package:flutter/material.dart';

class ButtonIconText extends StatelessWidget {
  const ButtonIconText({required this.icon,super.key, required this.onPressed, required this.text, required this.color});
  final void Function() onPressed;
  final Text text;
  final Color color;
    final Icon icon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
                      onPressed: () {
                        onPressed();
                      },
                      icon: icon,
                      label: text,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: color,
                        //foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                        // textStyle: TextStyle(
                        //   fontSize: size,
                        //   fontWeight: FontWeight.bold,
                        // ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
  }
}