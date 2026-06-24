import 'package:flutter/material.dart';

class CloudSuggestionCard extends StatelessWidget {
  final double confidence;
  final bool isOffline;
  final bool isLoading;
  final VoidCallback onUpload;

  const CloudSuggestionCard({
    super.key,
    required this.confidence,
    required this.isOffline,
    required this.isLoading,
    required this.onUpload,
  });

  @override
  Widget build(BuildContext context) {
    final isNudge = confidence >= 75.0;
    
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF3E8FF), // Light purple shade
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFFD8B4FE), // Slightly darker purple for border
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.cloud_upload_outlined, color: Color(0xFF7E22CE), size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  isNudge ? 'Advanced Cloud AI' : 'Low Confidence ( < 75% )',
                  style: const TextStyle(
                    color: Color(0xFF7E22CE),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            isNudge 
                ? 'Do you wish to use cloud models for more advanced processing?'
                : 'Do you want to upload this image to the cloud for more advanced AI processing?',
            style: const TextStyle(
              color: Color(0xFF6B21A8),
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 16),
          if (isLoading)
            const CircularProgressIndicator(color: Color(0xFF7E22CE))
          else
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: isOffline ? null : onUpload,
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF9333EA),
                  disabledBackgroundColor: Colors.grey.shade300,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text('Analyze with Cloud AI', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          if (isOffline && !isLoading)
            const Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: Text(
                'Internet unavailable',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
