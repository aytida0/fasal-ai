import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../data/models/diagnosis_result.dart';
import '../../../../shared/widgets/confidence_card.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../../../../shared/widgets/result_section_card.dart';

class DiagnosisScreen extends StatelessWidget {
  final DiagnosisResult result;

  const DiagnosisScreen({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    if (result.isHealthy) {
      return _HealthyDiagnosisView(
        result: result,
      );
    }

    return _DiseaseDiagnosisView(
      result: result,
    );
  }
}

class _HealthyDiagnosisView extends StatelessWidget {
  final DiagnosisResult result;

  const _HealthyDiagnosisView({
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }

        context.go('/home');
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(height: 12),

                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () => context.go('/home'),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(
                          color: const Color(0xFFF1F3F4),
                          width: 2,
                        ),
                      ),
                      child: GlassCard(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              CupertinoIcons.back,
                              color: Color(0xFF0B5D1E),
                              size: 20,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Result',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF0B5D1E),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                if (File(result.imagePath).existsSync())
                  GlassCard(
                    padding: const EdgeInsets.all(8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.file(
                        File(result.imagePath),
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                const SizedBox(height: 24),

                const Icon(
                  CupertinoIcons.checkmark_seal_fill,
                  color: Color(0xFF16A34A),
                  size: 120,
                ),

                const SizedBox(height: 20),

                const Text(
                  'Healthy Crop',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF16A34A),
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  result.cropName,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 24),

                ConfidenceCard(
                  confidence: result.confidence,
                  isHealthy: true,
                ),

                const SizedBox(height: 24),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Column(
                    children: [
                      Icon(
                        Icons.eco,
                        size: 40,
                        color: Colors.green,
                      ),
                      SizedBox(height: 12),
                      Text(
                        'No visible disease detected.',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: FilledButton.icon(
                    onPressed: () {
                      context.go('/home');
                    },
                    icon: const Icon(
                      Icons.camera_alt,
                    ),
                    label: const Text(
                      'Scan Another Crop',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DiseaseDiagnosisView extends StatelessWidget {
  final DiagnosisResult result;

  const _DiseaseDiagnosisView({
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }

        context.go('/home');
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => context.go('/home'),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(
                        color: const Color(0xFFF1F3F4),
                        width: 2,
                      ),
                    ),
                    child: GlassCard(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            CupertinoIcons.back,
                            color: Color(0xFF0B5D1E),
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Result',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF0B5D1E),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                if (File(result.imagePath).existsSync())
                  GlassCard(
                    padding: const EdgeInsets.all(8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.file(
                        File(result.imagePath),
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                const SizedBox(height: 24),

                Center(
                  child: Column(
                    children: [
                      const Icon(
                        CupertinoIcons.exclamationmark_triangle_fill,
                        color: Color(0xFFDC2626),
                        size: 100,
                      ),

                      const SizedBox(height: 16),

                      Text(
                        result.diseaseName ??
                            'Unknown Disease',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight:
                              FontWeight.bold,
                          color: Color(0xFFDC2626),
                        ),
                      ),

                      const SizedBox(height: 12),

                      Container(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color:
                              Colors.redAccent.shade100,
                          borderRadius:
                              BorderRadius.circular(
                            999,
                          ),
                        ),
                        child: const Text(
                          'Disease Detected',
                        ),
                      ),

                      const SizedBox(height: 12),

                      Text(
                        result.cropName,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 28),

                ConfidenceCard(
                  confidence: result.confidence,
                  isHealthy: false,
                ),

                const SizedBox(height: 24),

                ResultSectionCard(
                  title: 'Diagnosis',
                  child: Text(
                    result.diagnosis,
                  ),
                ),

                ResultSectionCard(
                  title: 'Treatment',
                  child: Column(
                    children: result.treatments
                        .map(
                          (treatment) => Padding(
                            padding:
                                const EdgeInsets.only(
                              bottom: 10,
                            ),
                            child: Row(
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                              children: [
                                const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 18,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    treatment,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),

                ResultSectionCard(
                  title: 'Prevention',
                  child: Column(
                    children: result.prevention
                        .map(
                          (item) => Padding(
                            padding:
                                const EdgeInsets.only(
                              bottom: 10,
                            ),
                            child: Row(
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                              children: [
                                const Icon(
                                  Icons.shield,
                                  color: Colors.blue,
                                  size: 18,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    item,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),

                const SizedBox(height: 12),

                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: FilledButton.icon(
                    onPressed: () {
                      context.go('/home');
                    },
                    icon: const Icon(
                      Icons.camera_alt,
                    ),
                    label: const Text(
                      'Scan Another Crop',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}