import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/services/gemini_service.dart';
import '../../../../data/models/diagnosis_result.dart';
import '../../../../data/repositories/history_repository.dart';
import '../../../../shared/widgets/confidence_card.dart';
import '../../../../shared/widgets/result_section_card.dart';
import '../widgets/cloud_suggestion_card.dart';

class DiagnosisScreen extends StatefulWidget {
  final DiagnosisResult result;

  const DiagnosisScreen({super.key, required this.result});

  @override
  State<DiagnosisScreen> createState() => _DiagnosisScreenState();
}

class _DiagnosisScreenState extends State<DiagnosisScreen> {
  late DiagnosisResult _result;
  bool _isOffline = false;
  bool _isLoadingCloud = false;

  @override
  void initState() {
    super.initState();
    _result = widget.result;
    _checkConnectivity();
    Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) {
      if (mounted) {
        setState(() {
          _isOffline = results.every((r) => r == ConnectivityResult.none);
        });
      }
    });
  }

  Future<void> _checkConnectivity() async {
    final results = await Connectivity().checkConnectivity();
    if (mounted) {
      setState(() {
        _isOffline = results.every((r) => r == ConnectivityResult.none);
      });
    }
  }

  Future<void> _uploadToCloud() async {
    setState(() => _isLoadingCloud = true);
    try {
      final cloudResult = await GeminiService().analyzeCrop(_result.imagePath);

      final historyRepo = HistoryRepository();
      await historyRepo.updateDiagnosisByImagePath(cloudResult);

      if (mounted) {
        setState(() {
          _result = cloudResult;
          _isLoadingCloud = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoadingCloud = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error analyzing with cloud: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_result.cropName == 'Unknown') {
      return _UnknownDiagnosisView(
        result: _result,
        isOffline: _isOffline,
        isLoadingCloud: _isLoadingCloud,
        onUpload: _uploadToCloud,
      );
    }

    if (_result.isHealthy) {
      return _HealthyDiagnosisView(
        result: _result,
        isOffline: _isOffline,
        isLoadingCloud: _isLoadingCloud,
        onUpload: _uploadToCloud,
      );
    }

    return _DiseaseDiagnosisView(
      result: _result,
      isOffline: _isOffline,
      isLoadingCloud: _isLoadingCloud,
      onUpload: _uploadToCloud,
    );
  }
}

class _HealthyDiagnosisView extends StatelessWidget {
  final DiagnosisResult result;
  final bool isOffline;
  final bool isLoadingCloud;
  final VoidCallback onUpload;

  const _HealthyDiagnosisView({
    required this.result,
    required this.isOffline,
    required this.isLoadingCloud,
    required this.onUpload,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        context.go('/home');
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => context.go('/home'),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(color: Colors.grey.shade200, width: 2),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          CupertinoIcons.back,
                          color: Color(0xFF0B5D1E),
                          size: 28,
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
                const SizedBox(height: 20),
                if (result.isCloudResult)
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF6FF),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFF93C5FD),
                        width: 1.5,
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.cloud_done,
                          color: Color(0xFF2563EB),
                          size: 18,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Result from Cloud Model',
                          style: TextStyle(
                            color: Color(0xFF1D4ED8),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                if (File(result.imagePath).existsSync())
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.grey.shade200, width: 2),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(
                        File(result.imagePath),
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                if (!result.isCloudResult && result.confidence < 90.0)
                  CloudSuggestionCard(
                    confidence: result.confidence,
                    isOffline: isOffline,
                    isLoading: isLoadingCloud,
                    onUpload: onUpload,
                  ),

                const SizedBox(height: 24),

                Center(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: const BoxDecoration(
                          color: Color(0xFFF0FDF4),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          CupertinoIcons.checkmark_seal_fill,
                          color: Color(0xFF16A34A),
                          size: 80,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Healthy Crop',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.5,
                          color: Color(0xFF16A34A),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        result.cropName.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2.0,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                ConfidenceCard(confidence: result.confidence, isHealthy: true),

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
                      Icon(Icons.eco, size: 40, color: Colors.green),
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
                    icon: const Icon(Icons.camera_alt, size: 26),
                    label: const Text(
                      'Scan Another Crop',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
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
  final bool isOffline;
  final bool isLoadingCloud;
  final VoidCallback onUpload;

  const _DiseaseDiagnosisView({
    required this.result,
    required this.isOffline,
    required this.isLoadingCloud,
    required this.onUpload,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        context.go('/home');
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => context.go('/home'),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(color: Colors.grey.shade200, width: 2),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          CupertinoIcons.back,
                          color: Color(0xFF0B5D1E),
                          size: 28,
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
                const SizedBox(height: 20),
                if (result.isCloudResult)
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF6FF),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFF93C5FD),
                        width: 1.5,
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.cloud_done,
                          color: Color(0xFF2563EB),
                          size: 18,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Result from Cloud Model',
                          style: TextStyle(
                            color: Color(0xFF1D4ED8),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                if (File(result.imagePath).existsSync())
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.grey.shade200, width: 2),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(
                        File(result.imagePath),
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                if (!result.isCloudResult && result.confidence < 90.0)
                  CloudSuggestionCard(
                    confidence: result.confidence,
                    isOffline: isOffline,
                    isLoading: isLoadingCloud,
                    onUpload: onUpload,
                  ),

                const SizedBox(height: 24),

                Center(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: const BoxDecoration(
                          color: Color(0xFFFEF2F2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          CupertinoIcons.exclamationmark_triangle_fill,
                          color: Color(0xFFDC2626),
                          size: 80,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        result.diseaseName ?? 'Unknown Disease',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.5,
                          color: Color(0xFFDC2626),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFDC2626),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: const Text(
                              'Disease Detected',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            result.cropName.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.5,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 28),

                ConfidenceCard(confidence: result.confidence, isHealthy: false),

                const SizedBox(height: 24),

                ResultSectionCard(
                  title: 'Diagnosis',
                  child: Text(result.diagnosis),
                ),

                ResultSectionCard(
                  title: 'Treatment',
                  child: Column(
                    children: result.treatments
                        .map(
                          (treatment) => Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 18,
                                ),
                                const SizedBox(width: 10),
                                Expanded(child: Text(treatment)),
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
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.shield,
                                  color: Colors.blue,
                                  size: 18,
                                ),
                                const SizedBox(width: 10),
                                Expanded(child: Text(item)),
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
                    icon: const Icon(Icons.camera_alt, size: 26),
                    label: const Text(
                      'Scan Another Crop',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
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

class _UnknownDiagnosisView extends StatelessWidget {
  final DiagnosisResult result;
  final bool isOffline;
  final bool isLoadingCloud;
  final VoidCallback onUpload;

  const _UnknownDiagnosisView({
    required this.result,
    required this.isOffline,
    required this.isLoadingCloud,
    required this.onUpload,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        context.go('/home');
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => context.go('/home'),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(color: Colors.grey.shade200, width: 2),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          CupertinoIcons.back,
                          color: Color(0xFF0B5D1E),
                          size: 28,
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
                const SizedBox(height: 20),
                if (result.isCloudResult)
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF6FF),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFF93C5FD),
                        width: 1.5,
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.cloud_done,
                          color: Color(0xFF2563EB),
                          size: 18,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Result from Cloud Model',
                          style: TextStyle(
                            color: Color(0xFF1D4ED8),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                if (File(result.imagePath).existsSync())
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.grey.shade200, width: 2),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(
                        File(result.imagePath),
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                if (!result.isCloudResult && result.confidence < 90.0)
                  CloudSuggestionCard(
                    confidence: result.confidence,
                    isOffline: isOffline,
                    isLoading: isLoadingCloud,
                    onUpload: onUpload,
                  ),

                const SizedBox(height: 32),

                Center(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFF7ED),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          CupertinoIcons.question_circle_fill,
                          color: Color(0xFFEA580C),
                          size: 80,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Uncertain Match',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.5,
                          color: Color(0xFFEA580C),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                Text(
                  result.diagnosis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, height: 1.5),
                ),

                const SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: FilledButton.icon(
                    onPressed: () {
                      context.go('/home');
                    },
                    icon: const Icon(Icons.camera_alt, size: 26),
                    label: const Text(
                      'Scan Another Crop',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
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
