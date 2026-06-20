import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/date_formatter.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../../../diagnosis/utils/history_mapper.dart';
import '../../../history/providers/history_provider.dart';

class DiagnosisHistorySection extends ConsumerWidget {
  const DiagnosisHistorySection({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final history =
        ref.watch(historyProvider);

    return Padding(
      padding:
          const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Previous Diagnoses',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                tooltip: 'Refresh',
                onPressed: () {
                  ref.invalidate(
                    historyProvider,
                  );
                },
                icon: const Icon(
                  Icons.refresh,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          history.when(
            loading: () =>
                const Center(
              child:
                  CircularProgressIndicator(),
            ),

            error: (_, _) =>
                GlassCard(
              child: const SizedBox(
                height: 120,
                child: Center(
                  child: Text(
                    'Unable to load history',
                  ),
                ),
              ),
            ),

            data: (items) {
              if (items.isEmpty) {
                return GlassCard(
                  child: SizedBox(
                    height: 180,
                    child: Center(
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .center,
                        children: const [
                          Icon(
                            Icons.eco,
                            size: 48,
                            color:
                                Colors.green,
                          ),

                          SizedBox(
                            height: 12,
                          ),

                          Text(
                            'No diagnoses yet',
                            style: TextStyle(
                              fontWeight:
                                  FontWeight
                                      .bold,
                            ),
                          ),

                          SizedBox(
                            height: 4,
                          ),

                          Text(
                            'Scan your first crop',
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }

              final latest =
                  items.take(5).toList();

              return Column(
                children:
                    latest.map((item) {
                  return GlassCard(
                    margin:
                        const EdgeInsets.only(
                      bottom: 12,
                    ),
                    padding:
                        EdgeInsets.zero,
                    child: InkWell(
                      borderRadius:
                          BorderRadius.circular(
                        20,
                      ),
                      onTap: () {
                        final result =
                            HistoryMapper
                                .toResult(
                          item,
                        );

                        context.push(
                          '/diagnosis',
                          extra: result,
                        );
                      },
                      child: ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 8,
                        ),

                        leading:
                            CircleAvatar(
                          backgroundColor:
                              item.isHealthy
                                  ? Colors
                                      .green
                                      .shade50
                                  : Colors
                                      .orange
                                      .shade50,
                          child: Icon(
                            item.isHealthy
                                ? Icons
                                    .check_circle
                                : Icons
                                    .warning,
                            color:
                                item.isHealthy
                                    ? Colors
                                        .green
                                    : Colors
                                        .orange,
                          ),
                        ),

                        title: Text(
                          item.cropName,
                        ),

                        subtitle: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,
                          children: [
                            Text(
                              item.isHealthy
                                  ? 'Healthy Crop'
                                  : item.diseaseName ??
                                      '',
                            ),
                            Text(
                              DateFormatter
                                  .format(
                                item.createdAt,
                              ),
                              style:
                                  const TextStyle(
                                fontSize:
                                    12,
                              ),
                            ),
                          ],
                        ),

                        trailing: Text(
                          '${item.confidence.toStringAsFixed(0)}%',
                          style:
                              const TextStyle(
                            fontWeight:
                                FontWeight
                                    .bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}