import 'package:flutter/material.dart';

class RemoveButton extends StatelessWidget {
  const RemoveButton({required this.onPressed, super.key});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.remove_circle_outline),
      onPressed: () {
        onPressed();
      },
    );
  }
}
