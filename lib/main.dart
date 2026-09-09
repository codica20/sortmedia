import 'package:dart_mappable/dart_mappable.dart'
    show MapperContainer;
import 'package:flutter/material.dart';
import 'package:sortmedia/features/analyze/engine/exif_analyzor.dart';
import 'package:sortmedia/features/analyze/engine/regex_analyzor.dart';

import 'features/analyze/engine/analyzor.dart';

import 'features/analyze/uistate/analyzor_list.dart';

import 'features/config/ui/config_screen.dart';

import 'features/home/ui/home_screen.dart';
import 'features/log/ui/logs_screen.dart';
import 'features/navigation/uistate/current_screen_model.dart';

import 'features/settings/uistate/settings_state.dart';
import 'features/log/uistate/logger.dart';
import 'utils/regexp_mapper.dart';

void main() {
  MapperContainer.globals.use(RegExpMapper());
  AnalyzorMapper.ensureInitialized();
  ExifAnalyzorMapper.ensureInitialized();
  RegExAnalyzorMapper.ensureInitialized();
  registerLogger();
  registerSettingsState();
  registerCurrentScreenModel();
  registerAnalyzorList();
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
