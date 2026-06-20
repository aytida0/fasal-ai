import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ImagePreviewScreen extends StatelessWidget {
  final File image;

  const ImagePreviewScreen({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.all(20),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(24),
                  child: Image.file(
                    image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
            ),

            Padding(
              padding:
                  const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton(
                  onPressed: () {
                    context.push(
                      '/loading',
                      extra: image,
                    );
                  },
                  child: const Text(
                    'Analyze Crop',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}