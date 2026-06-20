import 'package:flutter/material.dart';

import 'router/app_router.dart';
import 'theme/app_theme.dart';

class FasalAiApp extends StatelessWidget {
  const FasalAiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'FasalAI',
      theme: AppTheme.light,
      routerConfig: appRouter,
    );
  }
}