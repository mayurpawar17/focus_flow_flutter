import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_flow_flutter/core/constants/app_colors.dart';
import 'package:focus_flow_flutter/core/constants/app_spacing.dart';

import '../../../../core/network/dio_client.dart';
import '../../../entry/data/repo/entry_repo.dart';
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
    return BlocProvider(
      create: (context) {
        final repository = EntryRepo(DioClient());
        return EntryBloc(repository)..add(FetchTodayEntriesEvent());
      },
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: const Color(0xFFF8FAFC),
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
                        buildWhen: (prev, curr) =>
                            prev.runtimeType != curr.runtimeType ||
                            (curr is EntrySuccess &&
                                prev is EntrySuccess &&
                                prev.todayEntryResponse !=
                                    curr.todayEntryResponse),
                        builder: (context, state) {
                          if (state is EntryLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (state is EntryFailure) {
                            return Center(child: Text(state.error.toString()));
                          }

                          if (state is EntrySuccess) {
                            return EntryListView(
                              entries: state.todayEntryResponse.data ?? [],
                            );
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
        },
      ),
    );
  }
}
