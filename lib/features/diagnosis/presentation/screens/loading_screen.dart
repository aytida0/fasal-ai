import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../data/models/diagnosis_result.dart';
import '../../../../data/repositories/history_repository.dart';
import '../providers/diagnosis_provider.dart';
import '../../../history/providers/history_provider.dart';
import '../../../home/providers/home_stats_provider.dart';

class LoadingScreen extends ConsumerStatefulWidget {
  final File image;

  const LoadingScreen({super.key, required this.image});

  @override
  ConsumerState<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends ConsumerState<LoadingScreen> {
  int currentStep = 0;

  final steps = [
    'Processing image',
    'Identifying crop',
    'Detecting disease',
    'Preparing diagnosis',
  ];

  @override
  void initState() {
    super.initState();
    _runAnalysis();
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

    ref.invalidate(historyProvider);
    ref.invalidate(homeStatsProvider);

    if (!mounted) return;

    context.go('/diagnosis', extra: result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.eco, size: 80, color: Colors.green),

              const SizedBox(height: 40),

              ...List.generate(steps.length, (index) {
                final completed = index < currentStep;

                final active = index == currentStep;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      Icon(
                        completed
                            ? Icons.check_circle
                            : active
                            ? Icons.hourglass_top
                            : Icons.radio_button_unchecked,
                      ),

                      const SizedBox(width: 12),

                      Text(steps[index]),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
