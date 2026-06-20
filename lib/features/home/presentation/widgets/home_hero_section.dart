import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:fasal_ai/shared/widgets/glass_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sensors_plus/sensors_plus.dart';

import '../../providers/home_profile_provider.dart';

class HomeHeroSection extends ConsumerStatefulWidget {
  const HomeHeroSection({super.key});

  @override
  ConsumerState<HomeHeroSection> createState() => _HomeHeroSectionState();
}

class _HomeHeroSectionState extends ConsumerState<HomeHeroSection> {
  StreamSubscription? _sensorSubscription;

  double _dx = 0;
  double _dy = 0;

  @override
  void initState() {
    super.initState();

    _sensorSubscription = accelerometerEventStream().listen((event) {
      if (!mounted) {
        return;
      }

      setState(() {
        _dx = (-event.x * 1.5).clamp(-12.0, 12.0);

        _dy = (event.y * 1.2).clamp(-8.0, 8.0);
      });
    });
  }

  @override
  void dispose() {
    _sensorSubscription?.cancel();
    super.dispose();
  }

  String _greeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return 'Good Morning';
    }

    if (hour < 17) {
      return 'Good Afternoon';
    }

    return 'Good Evening';
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(homeProfileProvider);

    final size = MediaQuery.of(context).size;

    final heroHeight = size.height * 0.44;

    return profile.when(
      loading: () => SizedBox(height: heroHeight),

      error: (_, _) => SizedBox(height: heroHeight),

      data: (user) {
        return SizedBox(
          height: heroHeight,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned.fill(
                child: Transform.translate(
                  offset: Offset(_dx, _dy - 20),
                  child: OverflowBox(
                    maxWidth: size.width + 60,
                    maxHeight: heroHeight + 60,
                    child: Image.asset(
                      'assets/images/crop_hero.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: .02),
                        Colors.black.withValues(alpha: .05),
                        Colors.white.withValues(alpha: .08),
                        Colors.white.withValues(alpha: .18),
                        Colors.white.withValues(alpha: .45),
                        const Color(0xFFF5F8F4),
                      ],
                      stops: const [
                        .60,
                        .75,
                        .84,
                        .90,
                        .95,
                        .985,
                        1,
                      ],
                    ),
                  ),
                ),
              ),

              Positioned(
                top: MediaQuery.of(context).padding.top - 15,
                left: 10,
                child: GlassCard(
                  blur: 14,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${_greeting()} 👋',
                        style: const TextStyle(
                          color: Color(0xFF00A152),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        user?.name ?? 'Farmer',
                        style: const TextStyle(
                          color: Color(0xFF00A152),
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                top: MediaQuery.of(context).padding.top - 15,
                right: 10,
                child: GestureDetector(
                  onTap: () {
                    context.push('/profile');
                  },
                  child: GlassCard(
                    blur: 14,
                    padding: const EdgeInsets.all(8),
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.white.withValues(alpha: .15),
                      backgroundImage:
                          user?.imagePath != null &&
                                  File(user!.imagePath!).existsSync()
                              ? FileImage(
                                  File(user.imagePath!),
                                )
                              : null,
                      child: user?.imagePath == null ||
                              !File(user?.imagePath ?? '').existsSync()
                          ? Text(
                              (user?.name.isNotEmpty ?? false)
                                  ? user!.name.substring(0, 1).toUpperCase()
                                  : 'F',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            )
                          : null,
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: 27,
                left: 0,
                right: 0,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 28, sigmaY: 28),
                      child: Container(
                        width: size.width * .72,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 18,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          color: Colors.white.withValues(alpha: .08),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: .16),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Identify diseases early and protect your harvest.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 1.2,
                              ),
                            ),

                            const SizedBox(height: 16),

                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: .15),
                                borderRadius: BorderRadius.circular(999),
                              ),
                              child: const Text(
                                '🌱 Offline AI Ready',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
