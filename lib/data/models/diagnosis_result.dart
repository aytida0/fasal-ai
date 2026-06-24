class DiagnosisResult {
  final String cropName;

  final bool isHealthy;

  final String? diseaseName;

  final double confidence;

  final String diagnosis;

  final List<String> treatments;

  final List<String> prevention;

  final String imagePath;

  final bool isCloudResult;

  const DiagnosisResult({
    required this.cropName,
    required this.isHealthy,
    required this.diseaseName,
    required this.confidence,
    required this.diagnosis,
    required this.treatments,
    required this.prevention,
    required this.imagePath,
    this.isCloudResult = false,
  });
}