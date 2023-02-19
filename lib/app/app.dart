import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer/timer/view/timer_page.dart';
import 'package:time_split_repository/src/time_split_repository_base.dart';

class App extends StatelessWidget {
  const App({super.key, required this.timeSplitRepository});

  final TimeSplitRepository timeSplitRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: timeSplitRepository,
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(109, 234, 255, 1),
        colorScheme: const ColorScheme.light(
          secondary: Color.fromRGBO(72, 74, 126, 1),
        ),
      ),
      home: const TimerPage(),
    );
  }
}
