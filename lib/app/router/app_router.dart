import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/diagnosis_result.dart';
import '../../features/common/presentation/screens/crop_guide_screen.dart';
import '../../features/common/presentation/screens/disease_library_screen.dart';
import '../../features/diagnosis/presentation/screens/diagnosis_screen.dart';
import '../../features/diagnosis/presentation/screens/loading_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../features/scan/presentation/screens/image_preview_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';


final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>();

CustomTransitionPage<T> buildPageTransition<T>({
  required LocalKey key,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: key,
    child: child,
    transitionDuration:
        const Duration(milliseconds: 300),
    reverseTransitionDuration:
        const Duration(milliseconds: 250),
    transitionsBuilder: (
      context,
      animation,
      secondaryAnimation,
      child,
    ) {
      final slideAnimation =
          Tween<Offset>(
            begin: const Offset(0.04, 0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutCubic,
            ),
          );

      final fadeAnimation =
          Tween<double>(
            begin: 0,
            end: 1,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
            ),
          );

      return FadeTransition(
        opacity: fadeAnimation,
        child: SlideTransition(
          position: slideAnimation,
          child: child,
        ),
      );
    },
  );
}

final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        return buildPageTransition(
          key: state.pageKey,
          child: const SplashScreen(),
        );
      },
    ),

    GoRoute(
      path: '/onboarding',
      pageBuilder: (context, state) {
        return buildPageTransition(
          key: state.pageKey,
          child: const OnboardingScreen(),
        );
      },
    ),

    GoRoute(
      path: '/home',
      pageBuilder: (context, state) {
        return buildPageTransition(
          key: state.pageKey,
          child: const HomeScreen(),
        );
      },
    ),

    GoRoute(
      path: '/profile',
      pageBuilder: (context, state) {
        return buildPageTransition(
          key: state.pageKey,
          child: const ProfileScreen(),
        );
      },
    ),

    GoRoute(
      path: '/preview',
      pageBuilder: (context, state) {
        final image =
            state.extra as File;

        return buildPageTransition(
          key: state.pageKey,
          child: ImagePreviewScreen(
            image: image,
          ),
        );
      },
    ),

    GoRoute(
      path: '/loading',
      pageBuilder: (context, state) {
        final image =
            state.extra as File;

        return buildPageTransition(
          key: state.pageKey,
          child: LoadingScreen(
            image: image,
          ),
        );
      },
    ),

    GoRoute(
      path: '/diagnosis',
      pageBuilder: (context, state) {
        final result =
            state.extra as DiagnosisResult;

        return buildPageTransition(
          key: state.pageKey,
          child: DiagnosisScreen(
            result: result,
          ),
        );
      },
    ),

    GoRoute(
      path: '/crop-guide',
      pageBuilder: (context, state) {
        return buildPageTransition(
          key: state.pageKey,
          child: const CropGuideScreen(),
        );
      },
    ),

    GoRoute(
      path: '/disease-library',
      pageBuilder: (context, state) {
        return buildPageTransition(
          key: state.pageKey,
          child:
              const DiseaseLibraryScreen(),
        );
      },
    ),
  ],
);