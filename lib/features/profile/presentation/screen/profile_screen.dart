import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildAvatarHeader(),
            const SizedBox(height: 12),
            Text(
              'Alex Rivera',
              style: GoogleFonts.outfit(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.textHeadline,
              ),
            ),
            const Text(
              'alex.rivera@focusflow.com',
              style: TextStyle(color: AppColors.textBody, fontSize: 16),
            ),
            const SizedBox(height: 40),

            _buildSectionHeader('ACCOUNT'),
            _buildSettingsGroup([
              _buildProfileOption(Icons.person_outline, 'Personal Information'),
              _buildProfileOption(Icons.tune_rounded, 'Preferences'),
              _buildProfileOption(Icons.security_outlined, 'Security'),
            ]),

            const SizedBox(height: 30),
            _buildSectionHeader('APP SETTINGS'),
            _buildSettingsGroup([
              _buildProfileOption(
                Icons.notifications_none_rounded,
                'Notifications',
              ),
              _buildProfileOption(Icons.lock_outline_rounded, 'Data & Privacy'),
              _buildProfileOption(
                Icons.nightlight_round_outlined,
                'Dark Mode',
                trailing: CupertinoSwitch(
                  value: true,
                  onChanged: (v) {},
                  activeColor: AppColors.primary,
                ),
              ),
            ]),

            const SizedBox(height: 40),
            _buildLogOutButton(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarHeader() {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primary.withOpacity(0.5),
                width: 2,
              ),
            ),
            child: const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                'https://i.pravatar.cc/300?img=12',
              ), // Mock avatar
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.edit, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, bottom: 12),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: AppColors.textMuted,
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsGroup(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface.withOpacity(0.3),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildProfileOption(IconData icon, String title, {Widget? trailing}) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.primaryLight.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.primary, size: 22),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      ),
      trailing:
          trailing ?? const Icon(Icons.chevron_right, color: Colors.black26),
    );
  }

  Widget _buildLogOutButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.surface.withOpacity(0.5),
          foregroundColor: AppColors.textHeadline,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        icon: const Icon(Icons.logout_rounded, size: 20),
        label: const Text(
          'Log Out',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
