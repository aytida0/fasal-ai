import 'package:isar/isar.dart';

import '../local/isar_service.dart';
import '../models/diagnosis_history.dart';
import '../models/diagnosis_result.dart';

class HistoryRepository {
  Future<void> saveDiagnosis(
    DiagnosisResult result,
  ) async {
    final isar = await IsarService.instance();

    final history = DiagnosisHistory()
      ..cropName = result.cropName
      ..diseaseName = result.diseaseName
      ..isHealthy = result.isHealthy
      ..confidence = result.confidence
      ..imagePath = result.imagePath
      ..createdAt = DateTime.now()
      ..diagnosis = result.diagnosis
      ..treatments = result.treatments
      ..prevention = result.prevention;

    await isar.writeTxn(() async {
      await isar.diagnosisHistorys.put(history);
    });
  }

  Future<List<DiagnosisHistory>> getHistory() async {
    final isar = await IsarService.instance();

    return isar.diagnosisHistorys
        .where()
        .sortByCreatedAtDesc()
        .findAll();
  }
}