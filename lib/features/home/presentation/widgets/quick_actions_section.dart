import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../scan/presentation/providers/image_picker_provider.dart';
import '../../../../core/services/permission_service.dart';
import '../../../../shared/dialogs/permission_dialog.dart';

class QuickActionsSection extends ConsumerWidget {
  const QuickActionsSection({super.key});

  Future<void> _openCamera(BuildContext context, WidgetRef ref) async {
    final granted = await PermissionService().requestCamera();

    if (!granted) {
      if (context.mounted) {
        await showPermissionDialog(context, 'Camera');
      }
      return;
    }

    final File? image = await ref.read(imagePickerProvider).pickFromCamera();

    if (image == null) {
      return;
    }

    if (!context.mounted) {
      return;
    }

    context.push('/preview', extra: image);
  }

  Future<void> _openGallery(BuildContext context, WidgetRef ref) async {
    final granted = await PermissionService().requestPhotos();

    if (!granted) {
      if (context.mounted) {
        await showPermissionDialog(context, 'Photos');
      }
      return;
    }

    final File? image = await ref.read(imagePickerProvider).pickFromGallery();

    if (image == null) {
      return;
    }

    if (!context.mounted) {
      return;
    }

    context.push('/preview', extra: image);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 110,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          _ActionCard(
            icon: Icons.camera_alt,
            label: 'Scan Crop',
            onTap: () {
              _openCamera(context, ref);
            },
          ),

          const SizedBox(width: 12),

          _ActionCard(
            icon: Icons.upload,
            label: 'Upload',
            onTap: () {
              _openGallery(context, ref);
            },
          ),

          const SizedBox(width: 12),

          _ActionCard(
            icon: Icons.eco,
            label: 'Crop Guide',
            onTap: () {
              context.push('/crop-guide');
            },
          ),

          const SizedBox(width: 12),

          _ActionCard(
            icon: Icons.menu_book,
            label: 'Library',
            onTap: () {
              context.push('/disease-library');
            },
          ),
        ],
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 105,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black12)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.green),
            ),

            const SizedBox(height: 10),

            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}