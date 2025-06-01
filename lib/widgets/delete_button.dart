import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({required this.onPressed, super.key});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.delete,
        color: Color.fromARGB(235, 255, 255, 255),
        size: 36,
      ),
      onPressed: () {
        onPressed();
      },
    );
  }
}
