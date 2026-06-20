import 'package:flutter/material.dart';

class DiseaseLibraryScreen extends StatelessWidget {
  const DiseaseLibraryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Disease Library',
        ),
      ),
      body: const Center(
        child: Text(
          'Coming Soon',
        ),
      ),
    );
  }
}