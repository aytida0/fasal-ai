import 'dart:io';
import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sensors_plus/sensors_plus.dart';

import '../../../../data/models/diagnosis_result.dart';
import '../../../../data/repositories/history_repository.dart';
import '../providers/diagnosis_provider.dart';
import '../../../home/providers/home_stats_provider.dart';

class LoadingScreen extends ConsumerStatefulWidget {
  final File image;

  const LoadingScreen({super.key, required this.image});

  @override
  ConsumerState<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends ConsumerState<LoadingScreen>
    with SingleTickerProviderStateMixin {
  int currentStep = 0;

  StreamSubscription? _sensorSubscription;

  late final AnimationController _parallaxController;

  final ValueNotifier<Offset> _backgroundOffset =
      ValueNotifier(Offset.zero);

  Offset _targetOffset = Offset.zero;

  final steps = [
    'Processing image',
    'Identifying crop',
    'Detecting disease',
    'Preparing diagnosis',
  ];

  @override
  void initState() {
    super.initState();
    _parallaxController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )
      ..addListener(() {
        final current = _backgroundOffset.value;

        _backgroundOffset.value = Offset(
          current.dx + (_targetOffset.dx - current.dx) * 0.11,
          current.dy + (_targetOffset.dy - current.dy) * 0.11,
        );
      })
      ..repeat();

    _sensorSubscription = accelerometerEventStream().listen((event) {
      _targetOffset = Offset(
        (event.x * 3.2).clamp(-22.0, 22.0),
        (-event.y * 1.2).clamp(-8.0, 8.0),
      );
    });
    _runAnalysis();
  }

  @override
  void dispose() {
    _sensorSubscription?.cancel();
    _parallaxController.dispose();
    _backgroundOffset.dispose();
    super.dispose();
  }

  Future<void> _runAnalysis() async {
    for (int i = 0; i < steps.length; i++) {
      await Future.delayed(const Duration(milliseconds: 700));

      if (!mounted) return;

      setState(() {
        currentStep = i;
      });
    }

    final repository = ref.read(diagnosisRepositoryProvider);

    final DiagnosisResult result = await repository.analyze(widget.image);

    await HistoryRepository().saveDiagnosis(result);

    ref.invalidate(homeStatsProvider);

    if (!mounted) return;

    context.go('/diagnosis', extra: result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ValueListenableBuilder<Offset>(
              valueListenable: _backgroundOffset,
              builder: (_, offset, child) {
                return Transform.translate(
                  offset: offset,
                  child: child,
                );
              },
              child: OverflowBox(
                maxWidth: MediaQuery.of(context).size.width + 120,
                maxHeight: MediaQuery.of(context).size.height + 120,
                child: Image.asset(
                  'assets/images/crop-bg.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 2.5,
                sigmaY: 2.5,
              ),
              child: Container(
                color: Colors.white.withValues(alpha: .22),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: 420,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 28,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: .30),
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: .55),
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...List.generate(steps.length, (index) {
                        final completed = index < currentStep;
                        final active = index == currentStep;

                        final icon = completed
                            ? CupertinoIcons.check_mark_circled_solid
                            : active
                                ? CupertinoIcons.sparkles
                                : CupertinoIcons.circle;

                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 180),
                          curve: Curves.easeOutCubic,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: const BoxDecoration(),
                          child: AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 180),
                            style: TextStyle(
                              fontSize: active ? 28 : 21,
                              fontWeight:
                                  active ? FontWeight.w700 : FontWeight.w500,
                              color: active
                                  ? const Color(0xFF1B5E20)
                                  : Colors.black87,
                            ),
                            child: SizedBox(
                              height: 42,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  AnimatedScale(
                                    scale: active ? 1.25 : 1.0,
                                    duration: const Duration(milliseconds: 180),
                                    child: Icon(
                                      icon,
                                      size: active ? 32 : 22,
                                      color: completed || active
                                          ? const Color(0xFF1B5E20)
                                          : Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(steps[index]),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
