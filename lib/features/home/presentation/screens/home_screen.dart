import 'package:flutter/material.dart';

import '../widgets/ai_status_card.dart';
import '../widgets/diagnosis_history_section.dart';
import '../widgets/home_hero_section.dart';
import '../widgets/home_stats_row.dart';
import '../widgets/quick_actions_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight =
        MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor:
          const Color(0xFFF5F8F4),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height:
                  screenHeight * 0.44 +
                  60,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const HomeHeroSection(),

                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Transform.translate(
                      offset: const Offset(
                        0,
                        5,
                      ),
                      child:
                          const HomeStatsRow(),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(
              height: 28,
            ),
          ),

          const SliverToBoxAdapter(
            child: QuickActionsSection(),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),

          const SliverToBoxAdapter(
            child: AIStatusCard(),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(
              height: 24,
            ),
          ),

          const SliverToBoxAdapter(
            child: DiagnosisHistorySection(),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(
              height: 32,
            ),
          ),
        ],
      ),
    );
  }
}