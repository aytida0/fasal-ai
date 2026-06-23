import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../providers/profile_provider.dart';
import '../widgets/edit_name_dialog.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  Future<void> _pickProfileImage(BuildContext context, WidgetRef ref) async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 90,
    );

    if (image == null) {
      return;
    }

    await ref.read(profileRepositoryProvider).updateImage(image.path);

    ref.invalidate(profileProvider);
  }

  Future<void> _editName(
    BuildContext context,
    WidgetRef ref,
    String currentName,
  ) async {
    final result = await showDialog<String>(
      context: context,
      builder: (_) {
        return EditNameDialog(currentName: currentName);
      },
    );

    if (result == null || result.trim().isEmpty) {
      return;
    }

    await ref.read(profileRepositoryProvider).updateName(result.trim());

    ref.invalidate(profileProvider);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: profile.when(
          loading: () => const Center(child: CircularProgressIndicator()),

          error: (_, _) => const Center(child: Text('Unable to load profile')),

          data: (user) {
            if (user == null) {
              return const Center(child: Text('Profile not found'));
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _pickProfileImage(context, ref);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFFAFAFA),
                            border: Border.all(
                              color: const Color.fromARGB(255, 27, 169, 79),
                              width: 5,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 58,
                            backgroundColor: const Color.fromARGB(255, 231, 231, 231),
                            backgroundImage:
                                user.imagePath != null &&
                                    File(user.imagePath!).existsSync()
                                ? FileImage(File(user.imagePath!))
                                : null,
                            child: user.imagePath == null
                                ? Text(
                                    user.name.substring(0, 1).toUpperCase(),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : null,
                          ),
                        ),
                      ),

                      Positioned(
                        right: 2,
                        bottom: 2,
                        child: GestureDetector(
                          onTap: () {
                            _pickProfileImage(context, ref);
                          },
                          child: Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 27, 169, 79),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.edit,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Text(
                    user.name,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(
                          color: const Color(0xFF15803D),
                          fontWeight: FontWeight.w800,
                          fontSize: 32,
                        ),
                  ),

                  const SizedBox(height: 28),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(
                        color: const Color(0xFFE5E7EB),
                        width: 2,
                      ),
                    ),
                    child: Column(
                      children: [
                        _ProfileRow(
                          icon: CupertinoIcons.pencil,
                          title: 'Edit Name',
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            _editName(context, ref, user.name);
                          },
                        ),

                        const _ProfileDivider(),

                        const _ProfileRow(
                          icon: CupertinoIcons.globe,
                          title: 'Language',
                          value: 'English',
                        ),

                        const _ProfileDivider(),

                        const _ProfileRow(
                          icon: CupertinoIcons.archivebox,
                          title: 'Storage',
                          value: 'Local Device',
                        ),

                        const _ProfileDivider(),

                        const _ProfileRow(
                          icon: CupertinoIcons.leaf_arrow_circlepath,
                          title: 'Crop Model',
                          value: 'Offline Model V1.2',
                        ),

                        const _ProfileDivider(),

                        const _ProfileRow(
                          icon: CupertinoIcons.info_circle,
                          title: 'Version',
                          value: '1.0.5',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ProfileRow extends StatelessWidget {
  final IconData icon;

  final String title;

  final String? value;

  final Widget? trailing;

  final VoidCallback? onTap;

  const _ProfileRow({
    required this.icon,
    required this.title,
    this.value,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final row = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 250, 251, 249),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color.fromARGB(255, 216, 222, 217),
                width: 1,
              ),
            ),
            child: Icon(
              icon,
              size: 20,
              color: const Color(0xFF1B5E20),
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),

          if (value != null)
            Text(
              value!,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(
                    color: Colors.black87,
                  ),
            ),

          if (trailing != null) ...[const SizedBox(width: 6), trailing!],
        ],
      ),
    );

    if (onTap == null) {
      return row;
    }

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: row,
    );
  }
}

class _ProfileDivider extends StatelessWidget {
  const _ProfileDivider();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Divider(height: 1),
    );
  }
}
