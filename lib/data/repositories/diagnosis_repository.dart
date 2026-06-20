import 'dart:io';

import '../models/diagnosis_result.dart';

abstract class DiagnosisRepository {
  Future<DiagnosisResult> analyze(
    File image,
  );
}