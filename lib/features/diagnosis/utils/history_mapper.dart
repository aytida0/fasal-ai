import '../../../data/models/diagnosis_history.dart';
import '../../../data/models/diagnosis_result.dart';

class HistoryMapper {
  static DiagnosisResult toResult(
    DiagnosisHistory history,
  ) {
    return DiagnosisResult(
      cropName: history.cropName,
      isHealthy: history.isHealthy,
      diseaseName: history.diseaseName,
      confidence: history.confidence,
      diagnosis: history.diagnosis,
      treatments: history.treatments,
      prevention: history.prevention,
      imagePath: history.imagePath,
    );
  }
}