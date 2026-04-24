import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_flow_flutter/core/widgets/app_button.dart';
import 'package:focus_flow_flutter/core/widgets/custom_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_theme_colors.dart';
import '../../../entry/data/model/entry_request.dart';
import '../../../entry/presentation/bloc/entry_bloc.dart';
import '../../../entry/presentation/bloc/entry_event.dart';
import '../../../entry/presentation/bloc/entry_state.dart';
import '../widgets/section_label.dart';

class NewEntryScreen extends StatefulWidget {
  const NewEntryScreen({super.key});

  @override
  State<NewEntryScreen> createState() => _NewEntryScreenState();
}

class _NewEntryScreenState extends State<NewEntryScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contextController = TextEditingController();
  final TextEditingController _timeSpentController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose(); // Releases the memory
    _contextController.dispose();
    _timeSpentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EntryBloc, EntryState>(
      listener: (context, state) {
        if (state is EntrySaveSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.entryResponse.message.toString())),
          );
          Navigator.pop(context);
        }

        if (state is EntryFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message.toString())));
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

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
                    color: Theme.of(
                      context,
                    ).extension<AppThemeColors>()?.textPrimary,
                  ),
                ),
                AppSpacing.vsm,
                const Text(
                  'Quiet your mind and record your progress.',
                  style: TextStyle(color: AppColors.textBody, fontSize: 16),
                ),
                AppSpacing.vhuge,

                const SectionLabel('TASK IDENTITY'),
                CustomTextField(
                  hint: 'What are you focusing on?',
                  icon: Icons.title,
                  controller: _titleController,
                ),

                AppSpacing.vxxl,
                const SectionLabel('CONTEXT'),
                CustomTextField(
                  hint: 'e.g. Deep Work, Creative, Strategy, Learning',
                  icon: Icons.category,
                  controller: _contextController,
                ),
                AppSpacing.vxxl,
                const SectionLabel('DURATION (In Minutes)'),
                CustomTextField(
                  hint: 'e.g. 45',
                  icon: Icons.access_time_rounded,
                  controller: _timeSpentController,
                ),

                // AppSpacing.vxxl,
                // const SectionLabel('MOMENT'),
                // const CustomTextField(
                //   hint: 'Today, 2:45 PM',
                //   icon: Icons.calendar_today_outlined,
                // ),

                // const SizedBox(height: 40),
                // _buildQuoteCard(),
                // const SizedBox(height: 40),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomActionBar(context),
      ),
    );
  }

  Widget _buildBottomActionBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 10, 24, 30),
      color: Theme.of(context).scaffoldBackgroundColor,

      child: Row(
        children: [
          Expanded(
            child: AppButton(
              label: "Discard",
              type: ButtonType.secondary,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          AppSpacing.hmd,
          Expanded(
            child: BlocBuilder<EntryBloc, EntryState>(
              builder: (context, state) {
                return AppButton(
                  label: "Save",
                  icon: Icons.done_all,
                  isLoading: state is EntryLoading,
                  type: ButtonType.primary,
                  onPressed: () {
                    final time = int.tryParse(_timeSpentController.text);

                    if (time == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Enter valid time")),
                      );
                      return;
                    }
                    final entryRequest = EntryRequest(
                      title: _titleController.text,
                      category: _contextController.text,
                      timeSpent: time,
                    );
                    debugPrint("${entryRequest.toJson()}");
                    context.read<EntryBloc>().add(
                      SaveTodayEntryEvent(entryRequest),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Widget _buildQuoteCard() {
//   return Container(
//     width: double.infinity,
//     height: 200,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(24),
//       image: const DecorationImage(
//         image: NetworkImage(
//           'https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=1000',
//         ),
//         fit: BoxFit.cover,
//       ),
//     ),
//     child: Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(24),
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
//         ),
//       ),
//       padding: const EdgeInsets.all(20),
//       alignment: Alignment.bottomLeft,
//       child: const Text(
//         'Every minute is a fresh start.',
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     ),
//   );
// }
