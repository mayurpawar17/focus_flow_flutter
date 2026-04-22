import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_flow_flutter/features/home/presentation/screen/home_screen.dart';

import 'core/network/dio_client.dart';
import 'features/entry/data/repo/entry_repo.dart';
import 'features/entry/presentation/bloc/entry_bloc.dart';
import 'features/summary/presentation/bloc/summary_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final entryRepo = EntryRepo(DioClient());

    return MultiRepositoryProvider(
      providers: [RepositoryProvider.value(value: entryRepo)],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => EntryBloc(entryRepo)),
          // BlocProvider(create: (context) => SummaryBloc(entryRepo)),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FocusFlow',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
