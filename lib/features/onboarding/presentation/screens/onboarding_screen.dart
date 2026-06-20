import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../data/models/user_profile.dart';
import '../../../../data/repositories/profile_repository.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({
    super.key,
  });

  @override
  State<OnboardingScreen> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState
    extends State<OnboardingScreen> {
  final TextEditingController _nameController =
      TextEditingController();

  bool isLoading = false;

  Future<void> _continue() async {
    final name =
        _nameController.text.trim();

    if (name.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            'Please enter your name',
          ),
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    final profile = UserProfile()
      ..name = name
      ..createdAt = DateTime.now();

    await ProfileRepository()
        .saveProfile(profile);

    if (!mounted) return;

    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            children: [
              const Spacer(),

              const Icon(
                Icons.eco,
                size: 90,
                color: Colors.green,
              ),

              const SizedBox(height: 24),

              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'What should we call you?',
              ),

              const SizedBox(height: 32),

              TextField(
                controller: _nameController,
                textInputAction:
                    TextInputAction.done,
                onSubmitted: (_) {
                  _continue();
                },
                decoration:
                    InputDecoration(
                  hintText:
                      'Enter your name',
                  border:
                      OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(
                      16,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton(
                  onPressed: isLoading
                      ? null
                      : _continue,
                  child: isLoading
                      ? const SizedBox(
                          width: 22,
                          height: 22,
                          child:
                              CircularProgressIndicator(
                            strokeWidth:
                                2,
                          ),
                        )
                      : const Text(
                          'Continue',
                        ),
                ),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}