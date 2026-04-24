import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_flow_flutter/features/home/presentation/screen/home_screen.dart';

import 'core/network/dio_client.dart';
import 'core/theme/app_theme.dart';
import 'features/entry/data/repo/entry_repo.dart';
import 'features/entry/presentation/bloc/entry_bloc.dart';
import 'features/theme/bloc/theme_bloc.dart';
import 'features/theme/bloc/theme_event.dart';
import 'features/theme/bloc/theme_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
          BlocProvider(create: (_) => ThemeBloc()..add(LoadThemeEvent())),
        ],
        child: const AppView(),
        // child: MaterialApp(
        //   debugShowCheckedModeBanner: false,
        //   title: 'FocusFlow',
        //   theme: ThemeData(
        //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //   ),
        //   home: const HomeScreen(),
        // ),
      ),
    );
  }
}

// Separate widget for rebuild optimization
class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: state.themeMode,
          home: const HomeScreen(),
        );
      },
    );
  }
}
