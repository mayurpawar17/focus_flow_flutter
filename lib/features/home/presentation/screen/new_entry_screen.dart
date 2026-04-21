import 'package:flutter/material.dart';
import 'package:focus_flow_flutter/core/widgets/custom_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../widgets/context_chip.dart';
import '../widgets/section_label.dart';

class NewEntryScreen extends StatelessWidget {
  const NewEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'New Entry',
                style: GoogleFonts.outfit(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textHeadline,
                ),
              ),
              AppSpacing.vsm,
              const Text(
                'Quiet your mind and record your progress.',
                style: TextStyle(color: AppColors.textBody, fontSize: 16),
              ),
              AppSpacing.vhuge,

              SectionLabel('TASK IDENTITY'),
              CustomTextField(hint: 'What are you focusing on?'),

              AppSpacing.vxxl,
              SectionLabel('CONTEXT'),
              const Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  ContextChip(label: 'Deep Work', isSelected: true),
                  ContextChip(label: 'Creative'),
                  ContextChip(label: 'Strategy'),
                  ContextChip(label: 'Learning'),
                  ContextChip(label: 'Admin'),
                ],
              ),

              AppSpacing.vxxl,
              const SectionLabel('DURATION (OPTIONAL)'),
              const CustomTextField(
                hint: 'e.g. 45m',
                icon: Icons.access_time_rounded,
              ),

              AppSpacing.vxxl,
              const SectionLabel('MOMENT'),
              const CustomTextField(
                hint: 'Today, 2:45 PM',
                icon: Icons.calendar_today_outlined,
              ),

              // const SizedBox(height: 40),
              // _buildQuoteCard(),
              // const SizedBox(height: 40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomActionBar(context),
    );
  }

  Widget _buildQuoteCard() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: const DecorationImage(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=1000',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
          ),
        ),
        padding: const EdgeInsets.all(20),
        alignment: Alignment.bottomLeft,
        child: const Text(
          'Every minute is a fresh start.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomActionBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 10, 24, 30),
      color: AppColors.scaffoldBg,
      child: Row(
        children: [
          TextButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close, color: AppColors.textHeadline),
            label: const Text(
              'Discard',
              style: TextStyle(
                color: AppColors.textHeadline,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 5,
              shadowColor: AppColors.primary.withOpacity(0.4),
            ),
            icon: const Text(
              'Save Entry',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            label: const Icon(Icons.done_all, size: 20),
          ),
        ],
      ),
    );
  }
}
