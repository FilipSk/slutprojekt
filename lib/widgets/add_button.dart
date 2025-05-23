import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({required this.onPressed, super.key});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.add),
      onPressed: () {
        onPressed();
      },
    );
  }
}
