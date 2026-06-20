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

class _HomeHeroSectionState extends ConsumerState<HomeHeroSection>
    with SingleTickerProviderStateMixin {
  StreamSubscription? _sensorSubscription;

  late final AnimationController _parallaxController;

  final ValueNotifier<Offset> _imageOffset =
      ValueNotifier(Offset.zero);

  Offset _targetOffset = Offset.zero;

  @override
  void initState() {
    super.initState();
    _parallaxController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )
      ..addListener(() {
        final current = _imageOffset.value;
        _imageOffset.value = Offset(
          current.dx + (_targetOffset.dx - current.dx) * 0.11,
          current.dy + (_targetOffset.dy - current.dy) * 0.11,
        );
      })
      ..repeat();

    _sensorSubscription = accelerometerEventStream().listen((event) {
      if (!mounted) {
        return;
      }
      _targetOffset = Offset(
        (-event.x * 3.2).clamp(-22.0, 22.0),
        (event.y * 1.2).clamp(-8.0, 8.0),
      );
    });
  }

  @override
  void dispose() {
    _parallaxController.dispose();
    _imageOffset.dispose();
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

    final heroHeight = size.height * 0.45;

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
                child: ValueListenableBuilder<Offset>(
                  valueListenable: _imageOffset,
                  builder: (_, offset, child) {
                    return Transform.translate(
                      offset: Offset(
                        offset.dx,
                        offset.dy - 10,
                      ),
                      child: child,
                    );
                  },
                  child: OverflowBox(
                    maxWidth: size.width + 100,
                    maxHeight: heroHeight + 120,
                    child: Image.asset(
                      'assets/images/crop_hero.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              Positioned(
                left: 0,
                right: 0,
                bottom: -90,
                height: heroHeight * .55,
                child: IgnorePointer(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.white.withValues(alpha: .05),
                          Colors.white.withValues(alpha: .14),
                          Colors.white.withValues(alpha: .32),
                          Colors.white.withValues(alpha: .60),
                          Colors.white.withValues(alpha: .88),
                          const Color(0xFFF5F8F4),
                        ],
                        stops: const [
                          0.0,
                          .25,
                          .45,
                          .65,
                          .82,
                          .94,
                          1,
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                top: MediaQuery.of(context).padding.top - 5,
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
                top: MediaQuery.of(context).padding.top - 5,
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
                          ? FileImage(File(user.imagePath!))
                          : null,
                      child:
                          user?.imagePath == null ||
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
                bottom: 37,
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
                          vertical: 13,
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

                            const SizedBox(height: 7),

                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 6,
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
