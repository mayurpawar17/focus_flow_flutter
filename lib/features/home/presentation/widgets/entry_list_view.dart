import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_flow_flutter/core/utils/date_helper.dart';
import 'package:focus_flow_flutter/core/widgets/app_refresh.dart';
import 'package:focus_flow_flutter/features/entry/data/model/today_entry_response.dart';

import '../../../entry/presentation/bloc/entry_bloc.dart';
import '../../../entry/presentation/bloc/entry_event.dart';
import 'entry_card.dart';

class EntryListView extends StatelessWidget {
  final List<Data> entries;

  const EntryListView({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    return AppRefresh(
      onRefresh: () async {
        context.read<EntryBloc>().add(FetchTodayEntriesEvent());
      },
      child: entries.isEmpty
          ? ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: const [
                SizedBox(height: 300),
                Center(child: Text("No entries today")),
              ],
            )
          : ListView.separated(
              itemCount: entries.length,
              separatorBuilder: (_, _) => const SizedBox(height: 16),
              itemBuilder: (_, i) {
                final e = entries[i];
                return EntryCard(
                  category: e.category!.toUpperCase(),
                  title: e.title.toString(),
                  subtitle: DateHelper.extractTime(e.createdAt.toString()),
                  duration: "${e.timeSpent} min",
                );
              },
            ),
    );
  }
}
