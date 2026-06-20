import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> showPermissionDialog(
  BuildContext context,
  String permissionName,
) async {
  await showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        title: const Text(
          'Permission Required',
        ),
        content: Text(
          '$permissionName permission is required to continue.',
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
            onPressed: () async {
              Navigator.pop(context);
              await openAppSettings();
            },
            child: const Text(
              'Settings',
            ),
          ),
        ],
      );
    },
  );
}