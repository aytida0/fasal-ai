import 'package:isar/isar.dart';

part 'diagnosis_history.g.dart';

@collection
class DiagnosisHistory {
  Id id = Isar.autoIncrement;

  late String cropName;

  String? diseaseName;

  late bool isHealthy;

  late double confidence;

  late String imagePath;

  late DateTime createdAt;

  String diagnosis = '';

  List<String> treatments = [];

  List<String> prevention = [];

  bool isCloudResult = false;
}