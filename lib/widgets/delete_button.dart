import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({required this.onPressed, super.key});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.delete,
        color: Color.fromARGB(237, 245, 14, 14),
        size: 36,
      ),
      onPressed: () {
        onPressed();
      },
    );
  }
}
