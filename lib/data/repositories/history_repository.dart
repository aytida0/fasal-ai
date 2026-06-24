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
      ..prevention = result.prevention
      ..isCloudResult = result.isCloudResult;

    await isar.writeTxn(() async {
      await isar.diagnosisHistorys.put(history);
    });
  }

  Future<void> updateDiagnosisByImagePath(DiagnosisResult result) async {
    final isar = await IsarService.instance();
    
    final existing = await isar.diagnosisHistorys
        .filter()
        .imagePathEqualTo(result.imagePath)
        .findFirst();
        
    if (existing != null) {
      existing
        ..cropName = result.cropName
        ..diseaseName = result.diseaseName
        ..isHealthy = result.isHealthy
        ..confidence = result.confidence
        ..diagnosis = result.diagnosis
        ..treatments = result.treatments
        ..prevention = result.prevention
        ..isCloudResult = result.isCloudResult;

      await isar.writeTxn(() async {
        await isar.diagnosisHistorys.put(existing);
      });
    } else {
      // Fallback if not found
      await saveDiagnosis(result);
    }
  }

  Future<List<DiagnosisHistory>> getHistory() async {
    final isar = await IsarService.instance();

    return isar.diagnosisHistorys
        .where()
        .sortByCreatedAtDesc()
        .findAll();
  }

  Stream<List<DiagnosisHistory>> watchHistory() async* {
    final isar = await IsarService.instance();
    yield* isar.diagnosisHistorys
        .where()
        .sortByCreatedAtDesc()
        .watch(fireImmediately: true);
  }
}