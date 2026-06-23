import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/repositories/diagnosis_repository.dart';
import '../../../../data/repositories/tflite_diagnosis_repository.dart';

final diagnosisRepositoryProvider =
    Provider<DiagnosisRepository>(
  (ref) => TFLiteDiagnosisRepository(),
);