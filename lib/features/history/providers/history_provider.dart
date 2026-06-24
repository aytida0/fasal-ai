import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/diagnosis_history.dart';
import '../../../data/repositories/history_repository.dart';

final historyProvider =
    StreamProvider<List<DiagnosisHistory>>(
  (ref) {
    return HistoryRepository().watchHistory();
  },
);