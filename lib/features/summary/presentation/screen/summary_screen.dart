import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_flow_flutter/core/constants/app_spacing.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/theme/app_theme_colors.dart';
import '../../../../core/widgets/app_error_widget.dart';
import '../../../../core/widgets/app_loader.dart';
import '../../../entry/data/repo/entry_repo.dart';
import '../bloc/summary_bloc.dart';
import '../bloc/summary_event.dart';
import '../bloc/summary_state.dart';

class SummaryScreen extends StatelessWidget {
  SummaryScreen({super.key});

  bool isFailureState = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SummaryBloc>(
      create: (context) {
        return SummaryBloc(EntryRepo(DioClient()));
      },
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,

            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Today's Summary",
                      style: GoogleFonts.outfit(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(
                          context,
                        ).extension<AppThemeColors>()?.textPrimary,
                      ),
                    ),
                    AppSpacing.vxxl,

                    BlocBuilder<SummaryBloc, SummaryState>(
                      builder: (context, state) {
                        if (state is SummaryLoading) {
                          return const AppLoader();
                        }

                        if (state is SummaryFailure) {
                          return AppErrorWidget(
                            message: state.message,
                            icon: Icons.cloud_off_rounded,
                            actionLabel: "Retry",
                            onAction: () {
                              context.read<SummaryBloc>().add(
                                FetchTodaySummaryEvent(),
                              );
                            },
                          );
                        }
                        // if (state is SummaryFailure) {
                        //   isFailureState = true;
                        //   return Center(child: Text(state.message.toString()));
                        // }

                        if (state is SummarySuccess) {
                          return _buildAIPerspectiveCard(state, context);
                        }

                        return const SizedBox();
                      },
                    ),
                    AppSpacing.vhuge,
                    BlocBuilder<SummaryBloc, SummaryState>(
                      buildWhen: (prev, curr) =>
                          prev.runtimeType != curr.runtimeType,
                      builder: (context, state) {
                        // Hide button only in failure
                        if (state is SummaryFailure) {
                          return const SizedBox();
                        }

                        // Show loading state on button
                        final isLoading = state is SummaryLoading;

                        return AppButton(
                          icon: Icons.auto_awesome,
                          label: isLoading
                              ? "Generating..."
                              : "Generate AI Summary",
                          type: ButtonType.primary,
                          onPressed: isLoading
                              ? null // disable while loading
                              : () {
                                  context.read<SummaryBloc>().add(
                                    FetchTodaySummaryEvent(),
                                  );
                                },
                        );
                      },
                    ),
                    AppSpacing.vhuge,
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAIPerspectiveCard(SummarySuccess state, context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 20),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.auto_awesome,
                  size: 14,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 6),
                Text(
                  'AI PERSPECTIVE',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "SUMMARY :",
            style: GoogleFonts.outfit(
              fontSize: 18,
              color: Theme.of(context).extension<AppThemeColors>()?.textPrimary,
              height: 1.4,
            ),
          ),
          AppSpacing.vsm,
          Text(
            state.summaryModel.summary,
            style: GoogleFonts.outfit(
              fontSize: 18,
              color: Theme.of(context).extension<AppThemeColors>()?.textPrimary,
              height: 1.4,
            ),
          ),
          AppSpacing.vmd,
          Text(
            "INSIGHT :",
            style: GoogleFonts.outfit(
              fontSize: 18,
              color: Theme.of(context).extension<AppThemeColors>()?.textPrimary,
              height: 1.4,
            ),
          ),
          AppSpacing.vsm,
          Text(
            state.summaryModel.insight,
            style: GoogleFonts.outfit(
              fontSize: 18,
              color: Theme.of(context).extension<AppThemeColors>()?.textPrimary,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatTile(
    String val,
    String label,
    IconData icon,
    String subtitle,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, size: 20, color: AppColors.textHeadline),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 10,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            val,
            style: GoogleFonts.outfit(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: AppColors.textBody),
          ),
        ],
      ),
    );
  }

  Widget _buildFocusDistributionCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Focus Distribution',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '9AM',
                style: TextStyle(fontSize: 10, color: AppColors.textMuted),
              ),
              Text(
                '11AM',
                style: TextStyle(fontSize: 10, color: AppColors.textMuted),
              ),
              Text(
                '1PM',
                style: TextStyle(fontSize: 10, color: AppColors.textMuted),
              ),
              Text(
                '3PM',
                style: TextStyle(fontSize: 10, color: AppColors.textMuted),
              ),
              Text(
                '5PM',
                style: TextStyle(fontSize: 10, color: AppColors.textMuted),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildDistRow('Deep Work', '4.2h', AppColors.primary),
          const SizedBox(height: 12),
          _buildDistRow(
            'Collaboration',
            '1.8h',
            AppColors.primary.withOpacity(0.5),
          ),
        ],
      ),
    );
  }

  Widget _buildDistRow(String label, String time, Color color) {
    return Row(
      children: [
        CircleAvatar(radius: 4, backgroundColor: color),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: AppColors.textBody),
        ),
        const Spacer(),
        Text(
          time,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildActionableInsights() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.lightbulb_outline, size: 20, color: AppColors.primary),
              SizedBox(width: 8),
              Text(
                'Actionable Insights',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildInsightItem(
            'Morning Peak',
            'You complete 65% of your high-priority tasks before 11:00 AM.',
          ),
          const SizedBox(height: 12),
          _buildInsightItem(
            'Attention Decay',
            'Your focus typically drops after 90 minutes. A short walk could help.',
          ),
        ],
      ),
    );
  }

  Widget _buildInsightItem(String title, String desc) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            desc,
            style: const TextStyle(fontSize: 13, color: AppColors.textBody),
          ),
        ],
      ),
    );
  }

  Widget _buildReflectCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.primaryLight.withOpacity(0.3),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Reflect on the Flow',
            style: GoogleFonts.outfit(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'How did today feel? Taking a moment helps build a sustainable rhythm.',
            style: TextStyle(color: AppColors.textBody),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            label: const Icon(Icons.arrow_forward),
            icon: const Text('Log Reflection'),
          ),
        ],
      ),
    );
  }
}
