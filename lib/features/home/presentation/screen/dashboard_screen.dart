import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_flow_flutter/core/constants/app_colors.dart';
import 'package:focus_flow_flutter/core/constants/app_spacing.dart';
import 'package:focus_flow_flutter/core/widgets/app_loader.dart';

import '../../../entry/presentation/bloc/entry_bloc.dart';
import '../../../entry/presentation/bloc/entry_event.dart';
import '../../../entry/presentation/bloc/entry_state.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/entry_list_view.dart';
import 'new_entry_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFF8FAFC),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DashboardHeader(),
              AppSpacing.vxl,
              Expanded(
                child: BlocBuilder<EntryBloc, EntryState>(
                  buildWhen: (prev, curr) {
                    // Always rebuild if state type changes
                    if (prev.runtimeType != curr.runtimeType) return true;
                    // If both are success, rebuild if data changed
                    if (curr is EntrySuccess && prev is EntrySuccess) {
                      return prev.todayEntryResponse != curr.todayEntryResponse;
                    }
                    return false;
                  },
                  builder: (context, state) {
                    if (state is EntryLoading) {
                      return const AppLoader();
                    }

                    if (state is EntryFailure) {
                      return Center(child: Text(state.error.toString()));
                    }

                    if (state is EntrySuccess) {
                      return EntryListView(
                        entries: state.todayEntryResponse.data ?? [],
                      );
                    }

                    // Keep showing the list while EntrySaveSuccess is active
                    // or if it's the initial state (trigger fetch)
                    if (state is EntryInitial) {
                      context.read<EntryBloc>().add(FetchTodayEntriesEvent());
                    }

                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const NewEntryScreen()),
          );
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }
}
