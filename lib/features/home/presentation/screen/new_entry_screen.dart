import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_colors.dart';

class NewEntryScreen extends StatelessWidget {
  const NewEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
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
              const SizedBox(height: 8),
              const Text(
                'Quiet your mind and record your progress.',
                style: TextStyle(color: AppColors.textBody, fontSize: 16),
              ),
              const SizedBox(height: 40),

              _buildSectionLabel('TASK IDENTITY'),
              _buildTextField('What are you focusing on?'),

              const SizedBox(height: 30),
              _buildSectionLabel('CONTEXT'),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _buildContextChip('Deep Work', isSelected: true),
                  _buildContextChip('Creative'),
                  _buildContextChip('Strategy'),
                  _buildContextChip('Learning'),
                  _buildContextChip('Admin'),
                ],
              ),

              const SizedBox(height: 30),
              _buildSectionLabel('DURATION (OPTIONAL)'),
              _buildTextField('e.g. 45m', icon: Icons.access_time_rounded),

              const SizedBox(height: 30),
              _buildSectionLabel('MOMENT'),
              _buildTextField(
                'Today, 2:45 PM',
                icon: Icons.calendar_today_outlined,
              ),

              const SizedBox(height: 40),
              _buildQuoteCard(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomActionBar(context),
    );
  }

  Widget _buildSectionLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
          color: AppColors.textMuted,
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {IconData? icon}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: icon != null
              ? Icon(icon, color: AppColors.textMuted, size: 20)
              : null,
          hintStyle: const TextStyle(color: AppColors.textMuted),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildContextChip(String label, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.primaryLight
            : AppColors.surface.withOpacity(0.5),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected
              ? AppColors.primary
              : AppColors.textHeadline.withOpacity(0.7),
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
        ),
      ),
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
