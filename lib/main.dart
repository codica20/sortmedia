import 'package:flutter/material.dart';
import 'package:sort_media/features/config/ui/config_screen.dart';

import 'features/home/ui/home_screen.dart';
import 'features/log/ui/logs_screen.dart';
import 'features/navigation/uistate/current_screen_model.dart';

import 'features/settings/state/settings_state.dart';
import 'features/log/uistate/logger.dart';

void main() {
  registerLogger();
  registerSettingsState();
  registerCurrentScreenModel();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sort Media',
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: Colors.greenAccent,
        ),
      ),
      routes: {
        "/": (context) =>
            const HomeScreen(title: 'Sort Media'),
        "/config": (context) => const ConfigScreen(),
        "/logs": (context) => const LogsScreen(),
      },
    );
  }
}
