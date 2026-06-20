import 'package:flutter/material.dart';

class EditNameDialog extends StatefulWidget {
  final String currentName;

  const EditNameDialog({
    super.key,
    required this.currentName,
  });

  @override
  State<EditNameDialog> createState() =>
      _EditNameDialogState();
}

class _EditNameDialogState
    extends State<EditNameDialog> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(
      text: widget.currentName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Edit Name',
      ),
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(
          hintText: 'Enter your name',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Cancel',
          ),
        ),
        FilledButton(
          onPressed: () {
            Navigator.pop(
              context,
              controller.text.trim(),
            );
          },
          child: const Text(
            'Save',
          ),
        ),
      ],
    );
  }
}