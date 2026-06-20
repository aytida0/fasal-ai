import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../scan/presentation/providers/image_picker_provider.dart';

class QuickActionsSection extends ConsumerWidget {
  const QuickActionsSection({super.key});

  Future<void> _openCamera(BuildContext context, WidgetRef ref) async {
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
    final width = MediaQuery.of(context).size.width * .92;

    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: const Color.fromARGB(255, 234, 234, 234),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .05),
              blurRadius: 18,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: SizedBox(
          width: width,
          height: 175,
          child: Row(
            children: [
              Center(
                child: SizedBox(
                  width: 138,
                  height: 138,
                  child: _QuickActionTile(
                    label: 'Scan Crop',
                    icon: CupertinoIcons.viewfinder_circle_fill,
                    colors: const [Color(0xFF18B562), Color(0xFF00A152)],
                    largeIcon: true,
                    onTap: () => _openCamera(context, ref),
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    Expanded(
                      child: _QuickActionTile(
                        label: 'Choose Image',
                        icon: CupertinoIcons.photo_fill_on_rectangle_fill,
                        colors: const [Color(0xFF3E68F5), Color(0xFF2E5AE8)],
                        horizontal: true,
                        onTap: () => _openGallery(context, ref),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: _QuickActionTile(
                              label: 'Crop Guide',
                              icon: Icons.spa_rounded,
                              colors: const [
                                Color(0xFF8A3FFC),
                                Color(0xFF6E2AE6),
                              ],
                              onTap: () {
                                context.push('/crop-guide');
                              },
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: _QuickActionTile(
                              label: 'Disease Library',
                              icon: Icons.menu_book_rounded,
                              colors: const [
                                Color(0xFFF45A43),
                                Color(0xFFEE4B37),
                              ],
                              onTap: () {
                                context.push('/disease-library');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickActionTile extends StatelessWidget {
  final String label;
  final IconData icon;
  final List<Color> colors;
  final VoidCallback onTap;
  final bool horizontal;
  final bool largeIcon;

  const _QuickActionTile({
    required this.label,
    required this.icon,
    required this.colors,
    required this.onTap,
    this.horizontal = false,
    this.largeIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(32),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: colors.first.withValues(alpha: .28),
                blurRadius: 18,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: horizontal
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, color: Colors.white, size: 38),
                    const SizedBox(width: 12),
                    Flexible(
                      child: Text(
                        label,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          height: 1.15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, color: Colors.white, size: largeIcon ? 82 : 32),
                    const SizedBox(height: 4),
                    Text(
                      label,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: largeIcon ? 15 : 10,
                        fontWeight: FontWeight.w700,
                        height: 1.15,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
