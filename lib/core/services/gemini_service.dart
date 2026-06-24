import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import '../../data/models/diagnosis_result.dart';

class GeminiService {
  static final GeminiService _instance = GeminiService._internal();

  factory GeminiService() {
    return _instance;
  }

  GeminiService._internal();

  Future<String> _getAvailableModel(String apiKey) async {
    final client = HttpClient();
    try {
      final request = await client.getUrl(
        Uri.parse(
          'https://generativelanguage.googleapis.com/v1beta/models?key=$apiKey',
        ),
      );
      final response = await request.close();
      final responseBody = await response.transform(utf8.decoder).join();

      final data = jsonDecode(responseBody);
      final models = (data['models'] as List?) ?? [];

      // Filter for gemini models supporting generateContent
      final validModels = models
          .where((m) {
            final supportedMethods =
                (m['supportedGenerationMethods'] as List?) ?? [];
            final name = m['name'] as String? ?? '';
            return supportedMethods.contains('generateContent') &&
                name.contains('gemini');
          })
          .map((m) => m['name'] as String)
          .toList();

      if (validModels.isNotEmpty) {
        // Sort models to prioritize 'flash' and higher version numbers
        validModels.sort((a, b) {
          final aIsFlash = a.contains('flash');
          final bIsFlash = b.contains('flash');

          if (aIsFlash && !bIsFlash) return -1;
          if (!aIsFlash && bIsFlash) return 1;

          // Sort alphabetically descending (e.g. gemini-3.5 > gemini-1.5)
          return b.compareTo(a);
        });

        return validModels.first.replaceFirst('models/', '');
      }
    } catch (e) {
      return "";
    } finally {
      client.close();
    }

    // Ultimate fallback
    return 'gemini-1.5-flash';
  }

  Future<DiagnosisResult> analyzeCrop(String imagePath) async {
    final apiKey = dotenv.env['GEMINI_API_KEY'];
    if (apiKey == null ||
        apiKey.isEmpty ||
        apiKey == 'your_gemini_api_key_here') {
      throw Exception('Gemini API key is missing or invalid.');
    }

    final modelName = await _getAvailableModel(apiKey);

    final model = GenerativeModel(model: modelName, apiKey: apiKey);

    final fileBytes = await File(imagePath).readAsBytes();
    final imagePart = DataPart('image/jpeg', fileBytes);

    final prompt = TextPart('''
      You are an expert agronomist and crop disease detection AI.
      Analyze this image of a crop leaf.
      Return the diagnosis strictly in the following JSON format:
      {
        "cropName": "Name of the crop (e.g. Tomato, Corn)",
        "isHealthy": true/false,
        "diseaseName": "Name of the disease (or null if healthy)",
        "confidence": 95.0,
        "diagnosis": "A short 1-2 sentence description of the diagnosis",
        "treatments": ["Treatment 1", "Treatment 2"],
        "prevention": ["Prevention 1", "Prevention 2"]
      }
      Do not include markdown blocks, just the raw JSON string.
    ''');

    final response = await model.generateContent([
      Content.multi([prompt, imagePart]),
    ]);

    final text = response.text;
    if (text == null || text.isEmpty) {
      throw Exception('Empty response from Gemini API');
    }

    // Clean up potential markdown formatting (```json ... ```)
    var jsonString = text.trim();
    if (jsonString.startsWith('```json')) {
      jsonString = jsonString.substring(7);
    }
    if (jsonString.startsWith('```')) {
      jsonString = jsonString.substring(3);
    }
    if (jsonString.endsWith('```')) {
      jsonString = jsonString.substring(0, jsonString.length - 3);
    }
    jsonString = jsonString.trim();

    final data = jsonDecode(jsonString);

    return DiagnosisResult(
      cropName: data['cropName'] ?? 'Unknown',
      isHealthy: data['isHealthy'] ?? false,
      diseaseName: data['diseaseName'],
      confidence: (data['confidence'] as num?)?.toDouble() ?? 80.0,
      diagnosis: data['diagnosis'] ?? 'No diagnosis provided.',
      treatments: List<String>.from(data['treatments'] ?? []),
      prevention: List<String>.from(data['prevention'] ?? []),
      imagePath: imagePath,
      isCloudResult: true,
    );
  }
}
