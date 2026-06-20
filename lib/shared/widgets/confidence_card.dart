import 'package:flutter/material.dart';

class ConfidenceCard extends StatelessWidget {
  final double confidence;

  const ConfidenceCard({
    super.key,
    required this.confidence,
  });

  Color get confidenceColor {
    if (confidence >= 85) {
      return Colors.green;
    }

    if (confidence >= 60) {
      return Colors.orange;
    }

    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          const Text(
            'Confidence',
            style: TextStyle(
              fontSize: 16,
              fontWeight:
                  FontWeight.w600,
            ),
          ),

          const SizedBox(height: 16),

          Text(
            '${confidence.toStringAsFixed(1)}%',
            style: TextStyle(
              fontSize: 40,
              fontWeight:
                  FontWeight.bold,
              color: confidenceColor,
            ),
          ),

          const SizedBox(height: 16),

          ClipRRect(
            borderRadius:
                BorderRadius.circular(
              999,
            ),
            child:
                LinearProgressIndicator(
              minHeight: 10,
              value:
                  confidence / 100,
            ),
          ),
        ],
      ),
    );
  }
}