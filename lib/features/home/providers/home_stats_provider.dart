import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/repositories/history_repository.dart';

final homeStatsProvider =
    FutureProvider<HomeStats>(
  (ref) async {
    final items =
        await HistoryRepository()
            .getHistory();

    final totalScans =
        items.length;

    final diseases =
        items
            .where(
              (e) => !e.isHealthy,
            )
            .length;

    return HomeStats(
      totalScans: totalScans,
      diseasesDetected: diseases,
    );
  },
);

class HomeStats {
  final int totalScans;

  final int diseasesDetected;

  HomeStats({
    required this.totalScans,
    required this.diseasesDetected,
  });
}