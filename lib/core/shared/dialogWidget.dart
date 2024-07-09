import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onAccept;
  final VoidCallback onCancel;
  final String buttonText;

  CustomDialog(
      {required this.title,
      required this.content,
      required this.onAccept,
      required this.onCancel,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: onCancel,
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: onAccept,
          child: Text(buttonText),
        ),
      ],
    );
  }
}
