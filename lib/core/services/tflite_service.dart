import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;
import 'package:flutter_litert/flutter_litert.dart';

/// Loads and runs the crop-disease TFLite model.
///
/// Model specs:
///   Input  : [1, 224, 224, 3]  – Float32, [0, 255] range (MobileNetV3 scales internally)
///   Output : [1, 33]           – Softmax probabilities over 33 classes
class TFLiteService {
  static const String _modelPath = 'assets/models/crop_disease_model.tflite';
  static const int _inputSize = 224;
  static const int _numClasses = 33;

  Interpreter? _interpreter;

  // ── Lifecycle ───────────────────────────────────────────────────────────────

  /// Loads the model from the asset bundle. Called lazily on first [classify].
  Future<void> loadModel() async {
    final options = InterpreterOptions()..threads = 4;
    _interpreter = await Interpreter.fromAsset(
      _modelPath,
      options: options,
    );
  }

  /// Releases native resources. Call this when the service is no longer needed.
  void dispose() {
    _interpreter?.close();
    _interpreter = null;
  }

  // ── Public API ──────────────────────────────────────────────────────────────

  /// Preprocesses [imageFile] and runs inference.
  ///
  /// Returns the argmax class index and its softmax confidence score in [0, 1].
  Future<({int classIndex, double confidence})> classify(
    File imageFile,
  ) async {
    if (_interpreter == null) await loadModel();

    // Heavy pixel work runs in a background isolate to keep the UI smooth.
    final input = await compute(_buildInputTensor, imageFile.path);

    // Output buffer: [1, 33]
    final output = [List<double>.filled(_numClasses, 0.0)];

    _interpreter!.run(input, output);

    final scores = output[0];
    var maxScore = scores[0];
    var maxIdx = 0;
    for (var i = 1; i < scores.length; i++) {
      if (scores[i] > maxScore) {
        maxScore = scores[i];
        maxIdx = i;
      }
    }

    return (classIndex: maxIdx, confidence: maxScore);
  }
}

// ── Isolate helper ──────────────────────────────────────────────────────────
// Must be a top-level function so that compute() can transfer it to an isolate.

/// Builds the [1, 224, 224, 3] float tensor required by the model.
///
/// MobileNetV3 preprocessing is built into the Keras model (Rescaling layer).
/// Pass raw pixel values in [0, 255] range.
List<List<List<List<double>>>> _buildInputTensor(String imagePath) {
  final bytes = File(imagePath).readAsBytesSync();

  img.Image? image = img.decodeImage(bytes);
  if (image == null) {
    throw Exception('TFLiteService: failed to decode image at $imagePath');
  }

  // Resize to the model's expected spatial dimensions.
  image = img.copyResize(
    image,
    width: TFLiteService._inputSize,
    height: TFLiteService._inputSize,
    interpolation: img.Interpolation.linear,
  );

  return List.generate(1, (_) {
    return List.generate(TFLiteService._inputSize, (y) {
      return List.generate(TFLiteService._inputSize, (x) {
        final pixel = image!.getPixel(x, y);
        return [
          pixel.r.toDouble(),
          pixel.g.toDouble(),
          pixel.b.toDouble(),
        ];
      });
    });
  });
}
