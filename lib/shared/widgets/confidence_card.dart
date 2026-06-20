import 'package:flutter/material.dart';

class ConfidenceCard extends StatelessWidget {
  final double confidence;
  final bool isHealthy;

  const ConfidenceCard({
    super.key,
    required this.confidence,
    this.isHealthy = true,
  });

  Color get confidenceColor {
    return isHealthy
        ? const Color(0xFF16A34A)
        : const Color(0xFFDC2626);
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
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: confidenceColor.withValues(alpha: .12),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: confidenceColor.withValues(alpha: .08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
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
              fontSize: 42,
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
              color: confidenceColor,
              backgroundColor: confidenceColor.withValues(alpha: .12),
            ),
          ),
        ],
      ),
    );
  }
}