import 'dart:io';
import 'dart:math';

import '../models/diagnosis_result.dart';
import 'diagnosis_repository.dart';

class MockDiagnosisRepository
    implements DiagnosisRepository {
  @override
  Future<DiagnosisResult> analyze(
    File image,
  ) async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    final random = Random();

    final healthy =
        random.nextBool();

    if (healthy) {
      return DiagnosisResult(
        cropName: 'Rice',
        isHealthy: true,
        diseaseName: null,
        confidence: 96,
        diagnosis:
            'No disease detected.',
        treatments: [],
        prevention: [],
        imagePath: image.path,
      );
    }

    return DiagnosisResult(
      cropName: 'Rice',
      isHealthy: false,
      diseaseName: 'Leaf Blight',
      confidence: 92,
      diagnosis:
          'Possible bacterial leaf blight detected.',
      treatments: [
        'Remove infected leaves',
        'Improve drainage',
        'Avoid overwatering',
      ],
      prevention: [
        'Use disease resistant seeds',
        'Monitor weekly',
      ],
      imagePath: image.path,
    );
  }
}