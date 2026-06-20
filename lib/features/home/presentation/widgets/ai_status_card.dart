import 'package:flutter/material.dart';

import '../../../../shared/widgets/glass_card.dart';

class AIStatusCard extends StatelessWidget {
  const AIStatusCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_circle,
              color: Colors.green,
            ),
          ),

          const SizedBox(width: 16),

          const Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  'Offline AI Active',
                  style: TextStyle(
                    fontWeight:
                        FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Ready for crop diagnosis',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}