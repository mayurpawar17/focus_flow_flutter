import 'package:flutter/material.dart';
import 'package:focus_flow_flutter/core/constants/app_spacing.dart';
import 'package:focus_flow_flutter/core/widgets/app_button.dart';
import 'package:focus_flow_flutter/features/profile/presentation/screen/widgets/profile_header.dart';

import '../../../../core/constants/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const ProfileHeader(
                name: "Alex Rivera",
                email: "alex.rivera@focusflow.com",
              ),
              AppSpacing.vhuge,

              // _buildSectionHeader('ACCOUNT'),
              // _buildSettingsGroup([
              //   _buildProfileOption(
              //     Icons.person_outline,
              //     'Personal Information',
              //   ),
              //   _buildProfileOption(Icons.tune_rounded, 'Preferences'),
              //   _buildProfileOption(Icons.security_outlined, 'Security'),
              // ]),
              //
              // AppSpacing.vxxl,
              // _buildSectionHeader('APP SETTINGS'),
              // _buildSettingsGroup([
              //   _buildProfileOption(
              //     Icons.notifications_none_rounded,
              //     'Notifications',
              //   ),
              //   _buildProfileOption(
              //     Icons.lock_outline_rounded,
              //     'Data & Privacy',
              //   ),
              //   _buildProfileOption(
              //     Icons.nightlight_round_outlined,
              //     'Dark Mode',
              //     trailing: CupertinoSwitch(
              //       value: true,
              //       onChanged: (v) {},
              //       activeColor: AppColors.primary,
              //     ),
              //   ),
              // ]),
              AppSpacing.vhuge,
              AppButton(
                icon: Icons.logout,
                label: "Logout",
                type: ButtonType.primary,
                onPressed: () {},
              ),
              // _buildLogOutButton(),
              AppSpacing.vhuge,
            ],
          ),
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
