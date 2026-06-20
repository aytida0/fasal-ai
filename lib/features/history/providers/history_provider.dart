import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/diagnosis_history.dart';
import '../../../data/repositories/history_repository.dart';

final historyProvider =
    FutureProvider<List<DiagnosisHistory>>(
  (ref) async {
    return HistoryRepository().getHistory();
  },
);