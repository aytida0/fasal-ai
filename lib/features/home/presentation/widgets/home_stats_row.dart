import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../../shared/widgets/glass_card.dart';
import '../../providers/home_stats_provider.dart';

class HomeStatsRow extends ConsumerWidget {
  const HomeStatsRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(homeStatsProvider);

    return stats.when(
      loading: () => const SizedBox.shrink(),
      error: (_, _) => const SizedBox.shrink(),
      data: (data) {
        final width = MediaQuery.of(context).size.width;

        return Center(
          child: SizedBox(
            width: width * .78,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Expanded(
                    child: _StatItem(
                      value: data.totalScans.toString(),
                      label: 'Scans',
                    ),
                  ),

                  Container(
                    width: 1,
                    height: 42,
                    color: Colors.black45.withValues(alpha: .20),
                  ),

                  Expanded(
                    child: _StatItem(
                      value: data.diseasesDetected.toString(),
                      label: 'Diseases',
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;

  final String label;

  const _StatItem({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize:
          MainAxisSize.min,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 28,
            fontWeight:
                FontWeight.w700,
            height: 1,
          ),
        ),

        const SizedBox(
          height: 6,
        ),

        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: Colors.black54
                .withValues(
              alpha: .85,
            ),
            fontWeight:
                FontWeight.w500,
          ),
        ),
      ],
    );
  }
}