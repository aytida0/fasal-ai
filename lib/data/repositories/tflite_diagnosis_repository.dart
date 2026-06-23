import 'dart:io';

import '../local/crop_labels.dart';
import '../local/disease_knowledge_base.dart';
import '../models/diagnosis_result.dart';
import '../../core/services/tflite_service.dart';
import 'diagnosis_repository.dart';

// Production implementation of [DiagnosisRepository] that runs offline
// inference using the bundled MobileNetV3 TFLite model.

// Pipeline:
// File image
//  → [TFLiteService.classify]      → (classIndex, confidence)
//  → [CropLabels.labels][classIndex] → label key
//  → [DiseaseKnowledgeBase.data]   → [DiseaseInfo]
//  → [DiagnosisResult]             → caller

class TFLiteDiagnosisRepository implements DiagnosisRepository {
  TFLiteDiagnosisRepository() : _service = TFLiteService();

  final TFLiteService _service;

  // Minimum confidence required to trust the model's top prediction.
  static const double _confidenceThreshold = 0.43;

  @override
  Future<DiagnosisResult> analyze(File image) async {
    final (:classIndex, :confidence) = await _service.classify(image);

    // Low Confidence fallback
    if (confidence < _confidenceThreshold) {
      return DiagnosisResult(
        cropName: 'Unknown',
        isHealthy: false,
        diseaseName: null,
        confidence: confidence * 100,
        diagnosis:
            'The image could not be confidently matched to a supported crop. '
            'Please retake a clear, close-up photo of a single leaf in good '
            'lighting and try again.',
        treatments: [],
        prevention: [],
        imagePath: image.path,
      );
    }

    // Unmapped class index (model has 33 outputs, labels cover 31) 
    if (classIndex >= CropLabels.labels.length) {
      return DiagnosisResult(
        cropName: 'Unknown',
        isHealthy: false,
        diseaseName: null,
        confidence: confidence * 100,
        diagnosis:
            'The model identified a class that is not yet supported in this '
            'version. Please retake the photo or consult a local agronomist.',
        treatments: [],
        prevention: [],
        imagePath: image.path,
      );
    }

    //  Resolve label and knowledge-base entry 
    final labelKey = CropLabels.labels[classIndex];
    final info = DiseaseKnowledgeBase.data[labelKey];

    // Guard: should never happen if labels and KB are kept in sync.
    if (info == null) {
      return DiagnosisResult(
        cropName: labelKey.split('___').first,
        isHealthy: false,
        diseaseName: 'Unknown condition',
        confidence: confidence * 100,
        diagnosis:
            'Disease identified but detailed information is not yet available. '
            'Please consult a local agronomist.',
        treatments: [],
        prevention: [],
        imagePath: image.path,
      );
    }

    // :) 
    return DiagnosisResult(
      cropName: info.cropName,
      isHealthy: info.isHealthy,
      diseaseName: info.diseaseName,
      // store as percentage (0–100), cuz confidence is (0-1) we multiply it by 100
      confidence: confidence * 100,  
      diagnosis: info.diagnosis,
      treatments: info.treatments,
      prevention: info.prevention,
      imagePath: image.path,
    );
  }
}
